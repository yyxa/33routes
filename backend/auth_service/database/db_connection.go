package connection

import (
	"database/sql"
	"fmt"
	"os"
	"strconv"

	"github.com/joho/godotenv"
)

func init() {
	if err := godotenv.Load(); err != nil {
		fmt.Println("No .env file found")
	}
}

func GetDbConnection() *sql.DB {
	host, _ := os.LookupEnv("POSTGRES_HOST")

	port, _ := os.LookupEnv("POSTGRES_PORT")
	portInt, _ := strconv.Atoi(port)
	portUint := uint(portInt)

	user, _ := os.LookupEnv("POSTGRES_USER")
	password, _ := os.LookupEnv("POSTGRES_PASSWORD")
	dbname, _ := os.LookupEnv("POSTGRES_DB")

	psqlInfo := fmt.Sprintf("host=%s port=%d user=%s "+"password=%s dbname=%s sslmode=disable", host, portUint, user, password, dbname)

	db, err := sql.Open("postgres", psqlInfo)
	if err != nil {
		panic(err)
	}

	err = db.Ping()
	if err != nil {
		panic(err)
	}

	return db
}
