package auth_handlers

import (
	models "auth_service/src/models"
	"database/sql"
	"encoding/json"
	"fmt"
	"net/http"
	"time"

	"github.com/redis/go-redis/v9"
	"golang.org/x/crypto/bcrypt"
)

func checkUserExistanceToInsert(db *sql.DB, username *string, email *string) error {
	query := `SELECT user_id 
						FROM users 
						WHERE username = $1 OR email = $2`
	row := db.QueryRow(query, username, email)
	err := row.Scan(new(int))

	return err
}

func addUserToDB(db *sql.DB, user *models.UserRegisterInfo) (uint, error) {
	var existance bool
	err := checkUserExistanceToInsert(db, &user.Username, &user.Email)

	if err != nil {
		if err == sql.ErrNoRows {
			existance = false
		} else {
			return 0, fmt.Errorf("database error")
		}
	}

	if existance {
		return 0, fmt.Errorf("user already exists")
	}

	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(user.Password), bcrypt.DefaultCost)
	if err != nil {
		return 0, fmt.Errorf("error hashing password")
	}

	query := `INSERT INTO users (username, name, email, password_hash, created_at) VALUES ($1, $2, $3, $4, $5) RETURNING user_id`
	var userId int
	err = db.QueryRow(query, user.Username, user.Name, user.Email, hashedPassword, time.Now().Unix()).Scan(&userId)

	if err != nil {
		return 0, err
	}

	return uint(userId), nil
}

func RegisterUser(db *sql.DB, redisDb *redis.Client) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		var userData models.UserRegisterInfo

		if err := json.NewDecoder(r.Body).Decode(&userData); err != nil {
			http.Error(w, "Invalid request", http.StatusBadRequest)
			return
		}

		userId, err := addUserToDB(db, &userData)

		if err != nil {
			if err.Error() == "user already exists" {
				http.Error(w, "User already exists", http.StatusBadRequest)
				return
			} else if err.Error() == "database error" {
				http.Error(w, "Database error", http.StatusInternalServerError)
				return
			} else {
				http.Error(w, "Internal server error", http.StatusInternalServerError)
				return
			}
		}

		token, err := CreateToken(redisDb, &userId)

		if err != nil {
			http.Error(w, "Internal server error", http.StatusInternalServerError)
			return
		}

		response := models.UserRegisterResponse{
			User_id: userId,
			Token:   string(token),
		}

		w.Header().Set("Content-Type", "application/json")
		json.NewEncoder(w).Encode(response)
	}
}
