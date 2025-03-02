package auth_handlers

import (
	models "auth_service/src/models"
	"context"
	"database/sql"
	"encoding/json"
	"net/http"
	"strconv"

	"github.com/redis/go-redis/v9"
)

func CheckToken(db *sql.DB, redisDb *redis.Client) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		token := r.Header.Get("session-token")

		if token == "" {
			http.Error(w, "Unauthorized", http.StatusUnauthorized)
			return
		}

		user_id, err := redisDb.Get(context.Background(), r.Header.Get("session-token")).Result()

		if err != nil {
			http.Error(w, "Unauthorized", http.StatusUnauthorized)
			return
		}

		user_id_int, err := strconv.Atoi(user_id)

		if err != nil {
			http.Error(w, "Invalid session-token", http.StatusUnauthorized)
			return
		}

		response := models.TokenCheckResponse{
			User_id: uint(user_id_int),
		}

		w.Header().Set("Content-Type", "application/json")
		json.NewEncoder(w).Encode(response)
	}
}
