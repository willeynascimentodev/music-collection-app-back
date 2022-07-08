# Music Collection App - BackEnd

Steps to follow in order to install and run the app

1 - Install

{% filename %}command-line{% endfilename %}

bundle install

2 - Create Database and Activate Migrations

'db::create' 

'db::migrate '

3 - Open the file: 

config -> cors.rb and set origins to allow the specifc url wich will make the requests for this API.


4 To execute

{% filename %}command-line{% endfilename %}

bin/rails server


Information:

* Ruby version: 3.1.2

* Rails version: 7.0.3

* Database: sqlite3


Resources:

* albums [crud]

* auth [login]

* users[create]
