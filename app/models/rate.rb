class Rate < ApplicationRecord

  scope :available_currencies, -> { distinct.order(:from).pluck(:from) }

  def self.get_rate(from, to)
    find_by(from: from.upcase, to: to.upcase)&.rate
  end
end
