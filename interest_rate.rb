class InterestRate
  attr_reader :application_rate, :amount
  def initialize(amount:)
    self.amount = amount
    self.application_rate = 12
  end

private

  attr_writer :amount, :application_rate
end
