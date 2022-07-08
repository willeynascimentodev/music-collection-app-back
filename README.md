# Music Collection App - BackEnd

Steps to follow in order to install and run the app


### 1 - Install

bundle install



### 2 - Create Database and Activate Migrations

bin/rails db::create

bin/rails db::migrate



### 3 - Open the file: 

config -> cors.rb and set origins to allow the specifc url wich will make the requests for this API.



### 4 To execute

bin/rails server



### 5 - To run automated testes on your postman, use the file: tests.postman_collection



### Information:

* Ruby version: 3.1.2

* Rails version: 7.0.3

* Database: sqlite3



Resources:

* albums [crud]

* auth [login]

* users[create]
