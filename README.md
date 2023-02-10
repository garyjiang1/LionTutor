## Run locally
First, we need to install the correct ruby environment

### check ruby version
```sh
# for our project, we are using ruby version 3.1.0
# if the ruby version is not 3.1.0, please go to install the correct ruby version
ruby -v
```

### check rails version
```sh
# for our project, we are using rails version 7.0.4
# if the rails version is not 7.0.4, please go to install the correct rails version
rails -v
```

### Install Gem
Run `bundle install --without production` to make sure all gems are properly installed. 

### Create the initial database schema:

```shell
bundle exec rake db:migrate
bundle exec rake db:test:prepare
rake db:drop db:create db:migrate
```

- You can optionally add some seed data in `db/seeds.rb` and run `rake db:seed` to add it.

## You can run Unit test and Cucumber test by using the following command
```shell
# Before running tests, make sure your coverage folder is empty. And try to delete the coverage folder after executing each test.
bundle exec cucumber
bundle exec rspec
```
Alternatively, if you would like to see coverage by lines run `rails spec`

## Start server
`rails server -b localhost`

## Heroku Link
https://blooming-reef-86407.herokuapp.com/

## Original Github Link
https://github.com/Monirul1/COMSW4152_lion_tutor

## Contributors 🥒
The thanks goes to these wonderful people
- Md Monirul Islam (im2594)
- Faiza Khan (fk2421)
- Jiawei Jiang (jj3179)
- Sahitya Raipura (sr3962)

### If experiencing issues in "bundle install" stating "An error occurred while installing pg (1.4.4), and Bundler cannot continue # In Gemfile: pg" then run:
```shell
brew install postgresql
gem install pg -v '1.2.3' --source 'https://rubygems.org/
```
