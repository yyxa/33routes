package auth_handlers

import (
	"context"
	"fmt"
	"os"
	"strconv"
	"time"

	"github.com/golang-jwt/jwt/v5"
	"github.com/joho/godotenv"
	"github.com/redis/go-redis/v9"
)

func init() {
	if err := godotenv.Load(); err != nil {
		fmt.Println("No .env file found")
	}
}

type UserTokenBody struct {
	UserId uint `json:"user_id"`
}

func CreateToken(redisDb *redis.Client, userId *uint) (string, error) {
	key, status := os.LookupEnv("TOKEN_SECRET_KEY")

	if !status {
		return "", fmt.Errorf("secret key was not found")
	}

	token := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{
		"user_id": userId,
		"exp":     time.Now().AddDate(0, 6, 0).Unix(),
	})

	signed, err := token.SignedString([]byte(key))

	if err != nil {
		return "", fmt.Errorf("error signing token")
	}

	session_key := fmt.Sprintf("users_session:%v", strconv.Itoa(int(*userId)))
	redisDb.Set(context.Background(), session_key, signed, time.Hour*24*30*6)

	return signed, nil
}
