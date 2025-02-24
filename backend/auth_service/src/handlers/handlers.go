package auth_handlers

import (
	models "auth_service/src/models"
	"database/sql"
	"encoding/json"
	"fmt"
	"net/http"
)

func checkUserExistanceToInsert(db *sql.DB, username *string, email *string) error {
	query := `SELECT id 
						FROM users 
						WHERE username = $1 OR email = $2`
	row := db.QueryRow(query, username, email)
	err := row.Scan(new(int))

	return err
}

func addUserToDB(db *sql.DB, user *models.UserRegisterInfo) error {
	var existance bool
	err := checkUserExistanceToInsert(db, &user.Username, &user.Email)

	if err != nil {
		if err == sql.ErrNoRows {
			existance = false
		} else {
			return fmt.Errorf("database error")
		}
	}

	if existance {
		return fmt.Errorf("user already exists")
	}

	query := `INSERT INTO users (username, email, password) VALUES ($1, $2, $3)`
	_, err = db.Exec(query, user.Username, user.Email, user.Password)

	if err != nil {
		return err
	}

	return nil
}

func RegisterUser(db *sql.DB) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		var userData models.UserRegisterInfo

		if err := json.NewDecoder(r.Body).Decode(&userData); err != nil {
			http.Error(w, "Invalid request", http.StatusBadRequest)
			return
		}

		err := addUserToDB(db, &userData)

		if err.Error() == "user already exists" {
			http.Error(w, "User already exists", http.StatusBadRequest)
			return
		} else if err.Error() == "database error" {
			http.Error(w, "Database error", http.StatusInternalServerError)
			return
		} else if err != nil {
			http.Error(w, "Internal server error", http.StatusInternalServerError)
			return
		}

		// TODO: Return user id and token
	}
}
