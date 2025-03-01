package auth_handlers

import (
	"fmt"
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

func CreateToken(userId *uint) (string, error) {
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

	return signed, nil
}
