Management People App
=============

This application allows you to manage people, and receive email notifications when a person is added or removed from the records.

## Project delivery date: Monday, July 13, 2015.

## Instalation process

#### System dependencies
In addition to have the standard gems to run a RoR project, you need to have installed the following:

* Ruby version 2.2
* Rails version 4.2
* [Redis Server](http://redis.io/topics/quickstart)

##### Database setup

By default this project use [mysql2](https://github.com/brianmario/mysql2) database (although you can config your own database by changing the config/database.yml file and the Gemfile)

###### Install mysql2
If you're a Mac user run  `brew install mysql` or in Ubuntu run  `sudo apt-get install libmysqlclient-dev`

#### Instructions to run the project in your local environment

0. **Clone repository**
  * with SSH: `git clone git@github.com:robquesada/manage-people-app.git`
  * with HTTPS: `git clone https://github.com/robquesada/manage-people-app.git`

0. **Move to project directory**

    `cd manage-people-app`

0. **Install gems**

    `bundle install` or `bundle update`

0. **Configure Database**
    * Edit the `config/database.yml` file with your preference database. (Recommended: mysql2)
    * Setup database: `rake db:setup`

0. **Start servers and workers**
  * Run `mailcatcher`

    [Mailcatcher](http://mailcatcher.me/) helps you to send and receive emails in your local environment instead of handle real smtp configurations. **Make sure** you have it installed running `gem install mailcatcher`.
    If you want to use real emails, setup `config.action_mailer.smtp_settings` in `config/development.rb` file.

  * Run `redis-server`

    This will show you an overview of the Queues and its behaviours.
  
  * Run `QUEUE='*' rake environment resque:work`

    This wake up the queues on the project, used to send emails.
  
  * Run `mysql.server start`
  
  * Run `rails s`

0. **Go to**

  * [http://localhost:3000/](http://localhost:3000) To **use the app**
  * [http://localhost:1080/](http://localhost:1080) To check the emails sended

#### How to run the tests

0. **Prepare the test database (only first time)**

  Run `bundle exec rake db:drop db:create db:schema:load RAILS_ENV=test`

0. **Run tests**

  Run `rake test`
