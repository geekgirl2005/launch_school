# 1. understanding the problem
# INPUT
# the loan amount 
# the Annual Percentage Rate (APR) =>float number will be converted into %
# the loan duration => input in months

# OUTPUT
# monthly interest rate
# loan duration in months

#FORUMULA
# m = p * (j / (1 - (1 + j)**(-n)))
# m=>monthly payment; p => loan amount; j => monthly interest rate; n => loan duration in months

# DATA STRUCTURE => number
# SET loan_amount = loan amount 
# SET annual_percent_rate 
# SET monthly_interest_rate = annual_percent_rate /12

loan_amount = ''
annual_percent_rate = ''
monthly_interest_rate = annual_percent_rate /12

def integer?(input)
  /^\s*(?=.*[1-9])?[0-9]{1}*\.?[0-9]{1}$/.match(input) 
end

def prompt(message)
  puts('=>(message)')
end





