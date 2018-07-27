class CurrencyRatesSyncher
  CURRENCIES_SYNCH_COUNT = ENV.fetch("CURRENCIES_SYNCH_COUNT", 20).to_i

  def call
    get_usd_rates
    generate_rates

    true
  end

  private

  def get_usd_rates
    @rates_to_usd = CoinMarketCapWrapper.new.rates_to_usd(limit: CURRENCIES_SYNCH_COUNT)
  end

  def generate_rates
    compare_currencies = @rates_to_usd.keys.product(@rates_to_usd.keys)

    result = {}
    compare_currencies.each do |cur_arr|
      to = cur_arr[0]
      from = cur_arr[1]
      rate = @rates_to_usd[from] / @rates_to_usd[to].to_f

      rate_record = Rate.find_or_initialize_by(from: from, to: to)
      rate_record.update(rate: rate)
    end
  end
end