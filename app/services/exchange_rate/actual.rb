# frozen_string_literal: true

module ExchangeRate
  class Actual
    def call
      last_rate
    end

    private

    def last_rate
      day_ago = 1.day.ago
      record = RateVault.find_by('created_at > ?', day_ago)
      return record if record.present?

      crate_new_exchange_rate
    end

    def crate_new_exchange_rate
      RateVault.create(::ExchangeRate::Parse.new.call)
    end
  end
end
