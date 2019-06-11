class Balance
  attr_reader :amount

  def initialize(amount:)
    self.amount = amount
  end

private

  attr_writer :amount
end
