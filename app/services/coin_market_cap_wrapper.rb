class CoinMarketCapWrapper
  include HTTParty
  base_uri 'https://api.coinmarketcap.com'

  def rates_to_usd(limit: nil)
    result = self.class.get("/v2/ticker", { query: { limit: limit } })

    rates = {
      'USD' => 1
    }
    result['data'].map do |_, currency|
      rates[currency['symbol']] = currency['quotes']['USD']['price']
    end 

    rates
  end
end