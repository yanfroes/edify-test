## EdifyOnline - Junior Developer Challenge (https://www.edifyonline.com/)

This is the challenge: https://github.com/mvelosos/edify-developer-test
 
## Technologies used:
* Ruby on Rails API
* Vue.js
* PostgreSQL
* Github
* Redis
* Sidekiq
* Rspec
 
## To run the backend project:
* To install:
> gem install bundler && bundle install
* Create and migrate the database:
> rails db:create <br>
> rails db:migrate
* Run the project:
> rails s

## To run the front end project:
* Enter in the frontend folder
> cd edifyfront
* Install dependencies
> npm install
* Serve with hot reload at localhost:8080
> npm run dev

## To run the rake task to update pet names to "Sirius":
> rake pets_name:update_pet_name id=number<br>
> change "number" to the user_id you want

## To run the rake task to call a job to update pet names to "Sirius":
* You will need to run redis-server to call the job
> redis-server (if you dont have redis installed: https://redis.io/topics/quickstart<br>
> rake call_job_rename:update_pet_name id=2<br>
> change "number" to the user_id you want

## To run the front end tests (in progress):
* Run unit tests
> npm run unit
* Run all tests
> npm test

* **Yan Fróes**: @yanfroes (https://github.com/yanfroes)
