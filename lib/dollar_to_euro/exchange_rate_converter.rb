require_relative 'dollar'
require 'holidays'

class ExchangeRateConverter
  class << self
    def convert(amount, date)
      parsed_date = Date.parse(date)
      # if converting at oldest or latest rate
      return calculate_with_default_rate(amount, parsed_date) if default_date?(parsed_date)
      # if exchange rate exists for the given date return the exchange
      register = Dollar.where(date: parsed_date)
      return register.first.value * amount if register.exists?
      # if the date is holiday or weekend pick the previous available rate exchange
      pick_previous_available(parsed_date) * amount if date_is_holiday_or_weekend?(date)
    end

    def calculate_with_default_rate(amount, parsed_date)
      return Dollar.last.value * amount if Date.today == parsed_date
      return Dollar.first.value * amount if parsed_date < Dollar.first.date
    end

    # returns true if date is oldest than the oldest register we have
    # returns true if date is todays date
    def default_date?(parsed_date)
      Date.today == parsed_date || parsed_date < Dollar.first.date
    end

    def pick_previous_available(date)
      Dollar.where(:date.gte => (date - 7), :date.lte => date).last.value
    end

    def date_is_holiday_or_weekend?(date)
      weekend?(date) || holiday?(date)
    end

    def holiday?(date)
      Holidays.cache_between(Time.now, 2.years.from_now, :us, :observed)
      y, m, d = date.split '-'
      parsed_date = Date.civil(y.to_i, m.to_i, d.to_i)
      parsed_date.holiday?(:us)
    end

    def weekend?(date)
      [6, 7].include?(Date.parse(date).cwday)
    end

    def database_is_out_of_date?
      # TODO: evaluate when the database is out of date
      false
    end
  end
end