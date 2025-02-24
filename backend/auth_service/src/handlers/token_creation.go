package auth_handlers

import (
	"encoding/json"
	"fmt"
	"net/http"
	"os"
	"time"

	"github.com/golang-jwt/jwt/v5"
	"github.com/joho/godotenv"
)

func init() {
	if err := godotenv.Load(); err != nil {
		fmt.Println("No .env file found")
	}
}

type UserTokenBody struct {
	UserId uint `json:"user_id"`
}

func CreateToken() http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		var userData UserTokenBody
		key, status := os.LookupEnv("secret_key")

		if !status {
			http.Error(w, "Secret key was not found", http.StatusInternalServerError)
			return
		}

		if err := json.NewDecoder(r.Body).Decode(&userData); err != nil {
			http.Error(w, "Invalid request", http.StatusBadRequest)
			return
		}

		token := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{
			"user_id": userData.UserId,
			"exp":     time.Now().AddDate(0, 6, 0).Unix(),
		})

		signed, err := token.SignedString([]byte(key))

		if err != nil {
			http.Error(w, "Error signing token", http.StatusInternalServerError)
			return
		}

		w.Header().Set("Content-Type", "application/json")
		json.NewEncoder(w).Encode(map[string]string{"token": signed})
	}
}
