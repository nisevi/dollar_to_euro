# DollarToEuro

Command line tool to convert a dollar amount to euro.

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
    - `--source` url for CSV file from where we are getting the dollar values;

- Usage:
    - `bundle exec bin/dollar_to_euro 200 --date 2018-02-25`