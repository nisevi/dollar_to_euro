# DollarToEuro

Command line tool to convert a dollar amount to euro.

## Dependencies

- Redis:
    - [Quick installation guide](https://redis.io/topics/quickstart);

- Sidekiq:
    - For running locally you will need to run `bundle exec sidekiq -r ~/absolute/path/to/your/worker.rb`;
    - More info [here](https://www.youtube.com/watch?v=bfPb1zD91Rg&list=PLjeHh2LSCFrWGT5uVjUuFKAcrcj5kSai1); 

## Tests

- Rspec:
    - `bundle exec rspec`

- Cucumber:
    - `bundle exec cucumber`

## Running the converter

- Help:
    - `bundle exec bin/dollar_to_euro --help` to see the available options;

- Options:
    - `--date` to specify the date to pick the value of the euro from that day;
    - `--update` Updates the database;

- Usage:
    - `bundle exec bin/dollar_to_euro --date 2018-02-25 200` where 200 is the amount we want to convert from dollars to euros.