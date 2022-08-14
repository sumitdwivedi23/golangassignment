package handler

import (
	"database/sql"
	"fmt"
	// _ "github.com/mattn/go-sqlite3"
)

var db *sql.DB

const (
	host     = "localhost"
	port     = 5432
	user     = "blog"
	password = "12345"
	dbname   = "blogs"
)

//InitDB connect with with the database
func InitDB() {
	psqlInfo := fmt.Sprintf("host=%s port=%d user=%s "+
		"password=%s dbname=%s sslmode=disable",
		host, port, user, password, dbname)
	var err error
	db, err = sql.Open("postgres", psqlInfo)
	if err != nil {
		panic(err)
	}

	err = db.Ping()
	if err != nil {
		panic(err)
	}

	fmt.Println("Successfully connected!")
}
// func ConnectDatabase() error {
// 	db, err := sql.Open("sqlite3", "./blogDB.db")
// 	if err != nil {
// 		return err
// 	}

// 	err = db.Ping()
// 	if err != nil {
// 		panic(err)
// 	}

// 	fmt.Println("Successfully connected!")
// 	return nil
// }