class CurrencyConverter
  attr_reader :error, :result

  def initialize(from, to, amount)
    @from   = from
    @to     = to
    @amount = amount
  end

  def call
    check_currencies
    convert_currencies
    save_history
  rescue StandardError => error
    @error = error.message
  end

  private

  def check_currencies
    currencies_list = Rate.available_currencies
    unless currencies_list.include?(@from)
      raise StandardError.new("Currency 'from' is not supported.")
    end
    unless currencies_list.include?(@to)
      raise StandardError.new("Currency 'to' is not supported.")
    end
  end

  def convert_currencies
    @rate = Rate.get_rate(@from, @to)
    @result = @amount * @rate
  end

  def save_history
    ConvertionHistory.create(from: @from, to: @to, rate: @rate, amount: @result)
  end
end