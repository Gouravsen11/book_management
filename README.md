# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version : '3.0.0'

* System dependencies : sidekiq, redis-server

* Configuration: 
	`bundle`

* Database creation
	`rails db:create && db:migrate && db:seed`

* Database initialization

* How to run the test suite
	`rspec spec/`

* Services (job queues, cache servers, search engines, etc.)
	`rake import_authors:create_authors["/home/rails/Downloads/authors.csv"]`

	`if you're using a zsh shell, then you probably get this error: ``zsh: no matches found ...`

	`rake import_authors:create_authors\["/Users/gourav/Downloads/authors.csv"\]`

* Deployment instructions

* ...

* Postman collection: https://www.getpostman.com/collections/06e0efe3f63b449da60b



