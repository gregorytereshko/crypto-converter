namespace :converter do
  desc "Sync rates"
  task sync_rates: :environment do |task, args|
    CurrencyRatesSyncher.new.call
    puts 'Currency rates synched successfully.'
  end
end