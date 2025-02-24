package main

import (
	"database/sql"
	"fmt"
	"log"
	"net/http"

	dbconn "auth_service/database"
	handlers "auth_service/src/handlers"

	"github.com/go-chi/chi/v5"
	"github.com/joho/godotenv"
)

func init() {
	if err := godotenv.Load(); err != nil {
		fmt.Println("No .env file found")
	}
}

func main() {
	var db *sql.DB = dbconn.GetDbConnection()
	defer db.Close()

	r := chi.NewRouter()

	r.Post("api/auth/register", handlers.RegisterUser(db))

	log.Println("Auth server is running")
	http.ListenAndServe(":8081", r)
}
