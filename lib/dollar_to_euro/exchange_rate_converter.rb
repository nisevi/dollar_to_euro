# frozen_string_literal: true

require_relative 'dollar'

class ExchangeRateConverter
  class << self
    def convert(amount, date)
      parsed_date = Date.parse(date)
      return calculate_with_default_rate(amount, parsed_date) if default_date?(parsed_date)
      register = Dollar.where(date: parsed_date)
      return amount / register.first.value if register.exists?
      amount / previous_rate_available(parsed_date)
    end

    def calculate_with_default_rate(amount, parsed_date)
      return amount / Dollar.last.value if parsed_date >= Date.today
      amount / Dollar.first.value
    end

    def default_date?(parsed_date)
      parsed_date >= Date.today || parsed_date < Dollar.first.date
    end

    def previous_rate_available(date)
      Dollar.where(:date.lte => date).last.value
    end

    def database_is_out_of_date?
      Dollar.count.zero?
    end
  end
end
