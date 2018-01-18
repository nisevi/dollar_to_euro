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
    - `-u, --update` updates the database with the latest values;
    - `--version` it will give you the version of the gem you are using;

- Usage:
    - `dollar_to_euro --version`;
    - `dollar_to_euro --help`;
    - `dollar_to_euro --update`;
    - `dollar_to_euro --amount 200`;
    - `dollar_to_euro --date 2018-02-25 --amount 200`;

## Dependencies

- MongoDB:
    - You will need to [install MongoDB](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/);
    - For starting MongoDB server you may need to run `sudo mongod`;
    - For starting MongoDB client run `mongo`;
    - If you face an issue saying `/data/db` is missing, just create the directory with `sudo mkdir -p /data/db`;

- Redis:
    - [Quick installation guide](https://redis.io/topics/quickstart);

- Sidekiq:
    - For running locally you will need to start the worker `bundle exec sidekiq -r ~/absolute/path/to/dollar_to_euro/lib/dollar_to_euro/worker.rb`;
    - More info [here](https://www.youtube.com/watch?v=bfPb1zD91Rg&list=PLjeHh2LSCFrWGT5uVjUuFKAcrcj5kSai1); 

## Tests

- Rspec:
    - `bundle exec rspec`
    
- Cucumber:
    - `bundle exec cucumber`
