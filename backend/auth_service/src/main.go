package main

import (
	"context"
	"database/sql"
	"fmt"
	"log"
	"net/http"
	"os"

	dbconn "auth_service/database"
	handlers "auth_service/src/handlers"

	"github.com/go-chi/chi/v5"
	"github.com/joho/godotenv"
	_ "github.com/lib/pq"
	"github.com/redis/go-redis/v9"
)

func init() {
	if err := godotenv.Load(); err != nil {
		fmt.Println("No .env file found")
	}
}

func main() {
	var db *sql.DB = dbconn.GetDbConnection()
	defer db.Close()

	redisDb := redis.NewClient(&redis.Options{
		Addr:     os.Getenv("REDIS_HOST") + ":" + os.Getenv("REDIS_PORT"),
		Password: "",
		DB:       0,
	})

	_, err := redisDb.Ping(context.Background()).Result()

	if err != nil {
		log.Fatal("Redis connection failed:", err)
	}

	r := chi.NewRouter()

	r.Post("/api/auth/register", handlers.RegisterUser(db, redisDb))
	r.Get("/api/auth/check_token", handlers.CheckToken(db, redisDb))

	log.Println("Auth server is running")
	err = http.ListenAndServe(":8100", r)
	if err != nil {
		log.Fatal("Server failed to start:", err)
	}
}
