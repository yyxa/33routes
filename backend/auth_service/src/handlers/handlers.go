package auth_handlers

import (
	models "auth_service/src/models"
	"database/sql"
	"encoding/json"
	"fmt"
	"net/http"
	"time"

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

func addUserToDB(db *sql.DB, user *models.UserRegisterInfo) (error, uint) {
	var existance bool
	err := checkUserExistanceToInsert(db, &user.Username, &user.Email)

	if err != nil {
		if err == sql.ErrNoRows {
			existance = false
		} else {
			return fmt.Errorf("database error"), 0
		}
	}

	if existance {
		return fmt.Errorf("user already exists"), 0
	}

	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(user.Password), bcrypt.DefaultCost)
	if err != nil {
		return fmt.Errorf("Error hashing password"), 0
	}

	query := `INSERT INTO users (username, name, email, password_hash, created_at) VALUES ($1, $2, $3, $4, $5) RETURNING user_id`
	var userId int
	err = db.QueryRow(query, user.Username, user.Name, user.Email, hashedPassword, time.Now().Unix()).Scan(&userId)

	if err != nil {
		return err, 0
	}

	return nil, uint(userId)
}

func RegisterUser(db *sql.DB) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		var userData models.UserRegisterInfo

		if err := json.NewDecoder(r.Body).Decode(&userData); err != nil {
			http.Error(w, "Invalid request", http.StatusBadRequest)
			return
		}

		err, userId := addUserToDB(db, &userData)

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

		err, token := CreateToken(&userId)

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
