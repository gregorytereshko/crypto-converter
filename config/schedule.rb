every 5.minutes do
  runner "CurrencyRatesSyncher.new.call"
end