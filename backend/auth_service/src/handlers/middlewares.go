package auth_handlers

import (
	"context"
	"database/sql"
	"fmt"
	"math"
	"net/http"
	"os"
	"strings"
	"time"

	"github.com/golang-jwt/jwt/v5"
	"github.com/redis/go-redis/v9"
)

func extractUserIdFromToken(tokenStr string) (uint, error) {
	secretKey, exists := os.LookupEnv("TOKEN_SECRET_KEY")
	if !exists {
		return 0, fmt.Errorf("internal server error: secret key not found")
	}

	token, err := jwt.Parse(tokenStr, func(token *jwt.Token) (interface{}, error) {
		if _, ok := token.Method.(*jwt.SigningMethodHMAC); !ok {
			return nil, fmt.Errorf("internal server error: token parse error")
		}
		return []byte(secretKey), nil
	})

	if err != nil {
		return 0, fmt.Errorf("internal server error: token parse error")
	}

	claims, status := token.Claims.(jwt.MapClaims)
	if !status || !token.Valid {
		return 0, fmt.Errorf("unauthorized: invalid token")
	}

	userIDFloat, ok := claims["user_id"].(float64)
	if !ok {
		return 0, fmt.Errorf("unauthorized: user_id not found in token")
	}

	return uint(userIDFloat), nil
}

func CheckToken(db *sql.DB, redisDb *redis.Client) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		cookie, err := r.Cookie("session_token")

		if err != nil {
			http.Error(w, "Unauthorized", http.StatusUnauthorized)
			return
		}
		token := cookie.Value

		if token == "" {
			http.Error(w, "Bad request", http.StatusBadRequest)
			return
		}

		user_id, err := extractUserIdFromToken(token)

		if err != nil {
			if strings.Contains(err.Error(), "unauthorized") {
				// log (?)
				http.Error(w, "Unauthorized", http.StatusUnauthorized)
			} else {
				http.Error(w, "Internal server error", http.StatusInternalServerError)
			}
			return
		}

		key := fmt.Sprintf("user:%v", user_id)
		minUnixTime := fmt.Sprintf("%d", time.Now().Unix())
		maxUnixTime := fmt.Sprintf("%d", math.MaxInt32-1)

		userExistence := redisDb.Get(context.Background(), key)

		if userExistence == nil {
			http.Error(w, "Unauthorized", http.StatusUnauthorized)
			return
		}

		tokens, err := redisDb.ZRangeByScore(context.Background(), key, &redis.ZRangeBy{
			Min: minUnixTime,
			Max: maxUnixTime,
		}).Result()

		if err != nil {
			http.Error(w, "Bad request", http.StatusBadRequest)
			return
		}

		tokenFound := false
		for _, storedToken := range tokens {
			if storedToken == token {
				tokenFound = true
				break
			}
		}

		if !tokenFound {
			http.Error(w, "Unauthorized", http.StatusUnauthorized)
			return
		}

		w.WriteHeader(http.StatusOK)
	}
}
