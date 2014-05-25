== README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* Deployment instructions

== Ruby version
ruby 2.0.0p353
Rails 4.0.2

== System dependencies
1. installs rbenv which is used to select ruby version your application, according to rbenv's specification step by step. More details(https://github.com/sstephenson/rbenv)
2. installs ruby-build which is used to install ruby and rubygems. it is very important step after you finish installing rbenv. More details(https://github.com/sstephenson/ruby-build#readme)
3. installs bundler gems. Execute command: 
     gem install bundler
4. installs all required gems throgh bundler. Execute command:
     bundle install

== Configuration
Just need to configure config/database.yml, it looks like:
     
     production:
      adapter: mysql2
      database: mallms  #set database name
      username: root    #set database user
      password: 123456  #database password
      pool: 5
      timeout: 5000

== Database creation
create database, command:
     rake db:create

== Database initialization
run command:
     rake db:migrate
     rake db:seed   #just run the first time to import default 'admin' user account

== Deployment instructions
1. make sure you are in the root directory of application
2. compile all static resources in production environment. command:
     rake assets:precompile

3. Start up application:
     rails s -e production -p 8090

