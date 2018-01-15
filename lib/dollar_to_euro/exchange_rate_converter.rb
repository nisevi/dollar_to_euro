require_relative 'dollar'

class ExchangeRateConverter
  class << self
    def convert(amount, date)
      parsed_date = Date.parse(date)
      return 'Please update the database first' if database_is_out_of_date?
      return Dollar.last.value * amount if Date.today == parsed_date
      # TODO: consider to exclude holidays and weekends
    end

    def database_is_out_of_date?
      # TODO: evaluate when the database is out of date
      false
    end
  end
end