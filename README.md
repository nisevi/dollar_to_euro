[![Maintainability](https://api.codeclimate.com/v1/badges/a0b7d744a73e42bb731d/maintainability)](https://codeclimate.com/github/nisevi/dollar_to_euro/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/a0b7d744a73e42bb731d/test_coverage)](https://codeclimate.com/github/nisevi/dollar_to_euro/test_coverage) [![Build Status](https://semaphoreci.com/api/v1/nisevi/dollar_to_euro/branches/master/shields_badge.svg)](https://semaphoreci.com/nisevi/dollar_to_euro) [![Gem Version](https://badge.fury.io/rb/dollar_to_euro.svg)](https://badge.fury.io/rb/dollar_to_euro)

# DollarToEuro

Command line tool to convert a dollar amount to euro.

It keeps a database updated with the latest values for exchange from `1999-01-04` till now.

## Getting Started

- In your gemfile `gem 'dollar_to_euro'`

- Install it with `gem install dollar_to_euro`

## Running the converter

- Options:
    - `-h, --help` to see the available options;
    - `-a, --amount AMOUNT` to specify the amount you want to convert;
    - `-d, --date DATE` to specify the date to pick the exchange rate from that day, default `today`;
    - `--version` it will give you the version of the gem you are using;

- Usage:
    - `dollar_to_euro --version`;
    - `dollar_to_euro --help`;
    - `dollar_to_euro --amount 200`;
    - `dollar_to_euro --date 2018-02-25 --amount 200`;

## Dependencies

- MongoDB:
    - You will need to [install MongoDB](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/);
    - For starting MongoDB server you may need to run `sudo mongod`;
    - For starting MongoDB client run `mongo`;
    - If you face an issue saying `/data/db` is missing, just create the directory with `sudo mkdir -p /data/db`;

## Tests

- Rspec:
    - `bundle exec rspec`
    
- Cucumber:
    - `bundle exec cucumber`

## Updating the database

For updating the database you will find a rake task defined `update_dollar_to_euro_database`.

This rake task can be called from anywhere, within your rails app or just scheduled with a cron job.

For example if you are using Heroku you could use the [Heroku Scheduler](https://devcenter.heroku.com/articles/scheduler) for scheduling how oftern you want the database to be updated.
