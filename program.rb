@initial_principle = 14_829.43
@annual_interest = 0.1049
@monthly_interest = (@annual_interest / 12)
@monthly_payment = 340.58

def standard_payment(extra)
  @current_principal = @initial_principle
  month = 0
  total_payment = 0
  while @current_principal > 0
    @current_interest = @current_principal * @monthly_interest
    @current_principal += @current_interest
    @current_principal -= @monthly_payment + extra
    total_payment += @monthly_payment + extra
    month += 1
  end
  payment = (total_payment + @current_principal).round(2)
  puts "With $#{extra} extra >>>"
  puts "You made #{month} montly payments, over #{(month.to_f/12).round(2)} years."
  puts "You paid a total of $#{payment}\n\n"
  payment
end

def compare_savings(extra_amount1, extra_amount2)
  diff = standard_payment(extra_amount1) - standard_payment(extra_amount2)
  puts "By paying $#{extra_amount2} extra instead of $#{extra_amount1} extra, you saved $#{diff.round(2)}!
  \n-------------------------------------------------------------"
end

compare_savings(0, 100)
compare_savings(0, 275)
compare_savings(0, 300)
