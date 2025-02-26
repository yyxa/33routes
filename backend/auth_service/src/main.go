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
	_ "github.com/lib/pq"
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

	r.Post("/api/auth/register", handlers.RegisterUser(db))

	log.Println("Auth server is running")
	err := http.ListenAndServe(":8100", r)
	if err != nil {
		log.Fatal("Server failed to start:", err)
	}
}
