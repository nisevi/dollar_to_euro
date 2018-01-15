# DollarToEuro

Command line tool to convert a dollar amount to euro.

It keeps a database updated with the latest values for exchange from `1999-01-04` till now.

## Dependencies

- MongoDB:
    - You will need to [install MongoDB](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/);
    - For starting MongoDB you may need to run `sudo mongod`;
    - If you face an issue saying `/data/db` is missing, just run `sudo mkdir -p /data/db`;

- Redis:
    - [Quick installation guide](https://redis.io/topics/quickstart);

- Sidekiq:
    - For running locally you will need to run `bundle exec sidekiq -r ~/absolute/path/to/your/worker.rb`;
    - More info [here](https://www.youtube.com/watch?v=bfPb1zD91Rg&list=PLjeHh2LSCFrWGT5uVjUuFKAcrcj5kSai1); 

- Whenever:
    - If you want to activate the cron job for updating the database once per day remember you have to add the cron job, locally `whenever -i`;

## Tests

- Rspec:
    - `bundle exec rspec`

- Cucumber:
    - `bundle exec cucumber`

## Running the converter

- Help:
    - `bundle exec bin/dollar_to_euro --help` to see the available options;

- Options:
    - `--amount` to specify the amount you want to convert;
    - `--date` to specify the date to pick the value of the euro from that day, default `today`;
    - `--update` updates the database with the latest values;

- Usage:
    - `bundle exec bin/dollar_to_euro --date 2018-02-25 --amount 200`.
    - `bundle exec bin/dollar_to_euro --amount 200`.
    - `bundle exec bin/dollar_to_euro --update`.