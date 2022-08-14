
### To run this app clone this repo and navigate to the repo's directory with terminal and run command:
##  Step 1:
    Create a psql database which is running on port 5432 with following username and password and dbname
    host     = "localhost"
    port     = 5432
    user     = "postgres"
    password = "12345"
    dbname   = "blogDB"
    ```
    
    ```
- I have also tried to use sqlite3 base but some error was occcuring, I have also pushed the db file of sqlite3.
## Step 2:
   use table in create.sql file
## Step 3:
    go run main.go
## Step 4:
   Open a browser and navigate to localhost:8000
