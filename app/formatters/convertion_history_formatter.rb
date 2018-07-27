class ConvertionHistoryFormatter
  def initialize(limit)
    @limit = limit
  end
  
  def view_data
    prepare_history
  end

  private

  def prepare_history
    history_records = ConvertionHistory.order(created_at: :desc).limit(@limit)
    history_records.map do |record|
      {
        from: record.from,
        to: record.to,
        rate: record.rate,
        amount: record.amount,
        created_at: record.created_at.strftime("%Y-%m-%d %H:%M:%S")
      }
    end
  end
end