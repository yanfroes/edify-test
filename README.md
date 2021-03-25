<img src="https://i.ibb.co/ZXDBk9Y/edify.jpg" alt="edify" border="0">

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

## Database
<img src="https://i.ibb.co/0GdtQF4/Screenshot-2021-03-25-Edify-Db-Designer-net.png" alt="Screenshot-2021-03-25-Edify-Db-Designer-net" border="0">

## First download this project!

## To run the back-end project:
* Enter in the edify-test folder
* To install:
> gem install bundler<br>
> bundle install
* Create and migrate the database:
> rails db:create <br>
> rails db:migrate
* Run the project:
> rails s

## To run the front-end project:
* Open a new terminal and enter in the edifyfront folder
> cd edifyfront
* Install dependencies
> npm install
* Serve with hot reload at localhost:8080
> npm run dev
* Enter http://localhost:8080 to access the Front-end

## Open another terminal to open redis server:
> redis-server (if you dont have redis installed: https://redis.io/topics/quickstart)<br>

## To run the rake task to update pet names to "Sirius" (change "number" to the user_id you want):
> Enter in the edify-test folder<br>
> rake pets_name:update_pet_name id=number

## To run the rake task to call a job to update pet names to "Sirius" (change "number" to the user_id you want):
> Enter in the edify-test folder - the redis-server needs to be up<br>
> rake call_job_rename:update_pet_name id=number<br>

## To run the back-end tests (in progress):
* Run unit tests
> rspec

## To run the front-end tests (in progress):
* Run unit tests
> npm run unit
* Run all tests
> npm test


* **Yan Fróes**: @yanfroes (https://github.com/yanfroes)
