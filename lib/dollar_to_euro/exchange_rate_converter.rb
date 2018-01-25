# frozen_string_literal: true

require_relative 'dollar'

# ExchangeRateConverter class holds all the logic to make the conversion.
class ExchangeRateConverter
  class << self
    def convert(amount, date)
      parsed_date = Date.parse(date)
      # if converting at oldest or latest rate
      return calculate_with_default_rate(amount, parsed_date) if default_date?(parsed_date)
      # if exchange rate exists for the given date return the exchange
      register = Dollar.where(date: parsed_date)
      return amount / register.first.value if register.exists?
      # if the date doesn't exist in our database use the previous date available
      amount / previous_rate_available(parsed_date)
    end

    def calculate_with_default_rate(amount, parsed_date)
      return amount / Dollar.last.value if parsed_date >= Date.today
      amount / Dollar.first.value
    end

    # returns true if date is oldest than the oldest register we have
    # returns true if date is today's date
    def default_date?(parsed_date)
      parsed_date >= Date.today || parsed_date < Dollar.first.date
    end

    def previous_rate_available(date)
      Dollar.where(:date.lte => date).last.value
    end

    def database_is_out_of_date?
      # TODO: handle more complex scenarios
      Dollar.count.zero?
    end
  end
end
