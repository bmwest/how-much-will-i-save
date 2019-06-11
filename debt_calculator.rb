require_relative "./balance.rb"
require_relative "./interest_rate.rb"

class DebtCalculator
  def initialize(balance_due:, interest:, monthly_payment:)
    self.balance_due = Balance.new(amount: balance_due).amount
    self.interest = InterestRate.new(amount: interest)
    self.monthly_payment = monthly_payment
    self.interest_paid = 0
    self.total_payment = 0

    calculate_contribution
  end

  def calculate_contribution
    payment_interest = determine_interest_for_payment

    while balance_due > 0
      compound_interest(payment_interest: payment_interest)
      make_payments
    end

    puts "Total Payment #{total_payment}"
  end

  def compound_interest(payment_interest:)
    interest_due = find_interest_on_balance(interest_applied: payment_interest)
    interest_paid += interest_due
    apply_interest_to_balance(interest_accrued: interest_due)
  end

  def make_payments
    apply_payment_to_balance
    track_payment
  end

  def determine_interest_for_payment
    interest.amount / interest.application_rate
  end

  def find_interest_on_balance(interest_applied:)
    balance_due * interest_applied
  end

  def apply_interest_to_balance(interest_accrued:)
    balance_due += interest_accrued
  end

  def apply_payment_to_balance
    balance_due -= monthly_payment
  end

  def track_payment
    total_payment += combine_payment_and_interest_accrual
  end

  def combine_payment_and_interest_accrual
    monthly_payment + interest_paid
  end
private

  attr_accessor :balance_due, :interest, :interest_paid, :monthly_payment, :total_payment

end
