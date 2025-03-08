package auth_handlers

import (
	models "auth_service/src/models"
	"context"
	"database/sql"
	"encoding/json"
	"fmt"
	"math"
	"net/http"
	"time"

	"github.com/redis/go-redis/v9"
)

func CheckToken(db *sql.DB, redisDb *redis.Client) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		var userData models.TokenCheck

		if err := json.NewDecoder(r.Body).Decode(&userData); err != nil {
			http.Error(w, "Bad request", http.StatusBadRequest)
			return
		}

		token := r.Header.Get("session-token")

		if token == "" {
			http.Error(w, "Bad request", http.StatusBadRequest)
			return
		}

		key := fmt.Sprintf("user:%v", userData.User_id)
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
