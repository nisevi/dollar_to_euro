# frozen_string_literal: true

require_relative 'dollar'
require 'holidays'
require 'holidays/core_extensions/date'

class Date
  include Holidays::CoreExtensions::Date
end

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
      previous_rate_available(parsed_date) * amount if date_is_holiday_or_weekend?(date)
    end

    def calculate_with_default_rate(amount, parsed_date)
      return Dollar.last.value * amount if parsed_date >= Date.today
      Dollar.first.value * amount
    end

    # returns true if date is oldest than the oldest register we have
    # returns true if date is today's date
    def default_date?(parsed_date)
      parsed_date >= Date.today || parsed_date < Dollar.first.date
    end

    def previous_rate_available(date)
      Dollar.where(:date.lte => date).last.value
    end

    def date_is_holiday_or_weekend?(date)
      weekend?(date) || holiday?(date)
    end

    def holiday?(date)
      Holidays.cache_between(Time.now, 2.years.from_now, :us, :observed)
      year, month, day = date.split '-'
      parsed_date = Date.civil(year.to_i, month.to_i, day.to_i)
      parsed_date.holiday?(:us)
    end

    def weekend?(date)
      [6, 7].include?(Date.parse(date).cwday)
    end

    def database_is_out_of_date?
      # TODO: handle more complex scenarios
      Dollar.count.zero?
    end
  end
end
