# README

## Docker
1. install [Docker](https://www.docker.com/products/docker) and start your Docker client
2. create a `.env` file with appropriate variables (e.g. DB_HOST, DB_ADAPTER, etc...) *Note: do not check this file into source control*
3. `docker-compose up --build`. this will build your image and run your db and web app
4. to run typical rails commands you will need to prefix them with `docker-compose run --rm web`. (e.g. `docker-compose run --rm web bin/rails g migration AddStuffToThings`). *Tip*: you should be able to create an alias in your command shell. for example, if you use ZSH you could set `alias dcr='docker-compose run --rm web` and then run `dcr bin/rails g migration whatever`.

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
