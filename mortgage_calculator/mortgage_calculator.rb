#require "pry"
require 'yaml'
MESSAGES = YAML.load_file('messages.yml')

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
annual_percent_rate_calc = ''
monthly_interest_rate = ''
loan_duration = ''
monthly_payment = ''
interest_payments = ''
interest_payments = ''

summary = <<-MSG
Your payment summary:
Your monthly payment: 
Your payment will last: #{loan_duration}
MSG


def integer?(input)
  /^\s*(?=.*[1-9])\d*(?:\.\d{1,2})?\s*$/.match(input) 
end

def prompt(message)
  puts("=> #{message}")
end

loop do 
  prompt(MESSAGES['welcome'])
  prompt(MESSAGES['loan_amount'])

      loop do
        loan_amount = gets.chomp
        break if (integer?(loan_amount))
          prompt(MESSAGES['invalid_number'])
      end

      prompt(MESSAGES['annual_percent_rate'])

      loop do
        annual_percent_rate = gets.chomp
        break if (integer?(annual_percent_rate))
        prompt(MESSAGES['invalid_number'])
      end

      prompt(MESSAGES['loan_duration'])

      loop do
        loan_duration = gets.chomp
        break if(integer?(loan_duration))
        prompt(MESSAGES['invalid_number'])
      end
      annual_percent_rate_calc = annual_percent_rate.to_f / 100

      puts("annual_percent_rate_calc = #{annual_percent_rate_calc}")

      monthly_interest_rate = (annual_percent_rate_calc.to_f / 12).round(3)

      monthly_payment = loan_amount.to_f * (monthly_interest_rate.to_f*(1 + monthly_interest_rate.to_f)**loan_duration.to_f) / ((1 + monthly_interest_rate.to_f)**loan_duration.to_f - 1)
      #M = P [ i(1 + i)^n ] / [ (1 + i)^n – 1]

      total_payments = (monthly_payment.to_f * loan_duration.to_f) 

      interest_payments = (monthly_payment.to_f * loan_duration.to_f) - loan_amount.to_f

      summary = <<-MSG
      Your payment summary:
          Your amount loan: #{loan_amount}
          Your monthly payment: #{monthly_payment.to_f.round(2)}
          Your payment will last: #{loan_duration}
          Your total payment including interests will be: #{total_payments.to_f.round(2)}
          Interest total: #{interest_payments.to_f.round(2)}
      MSG

      prompt(summary)

      prompt(MESSAGES['more_calculations'])
      answer = gets.chomp
      break unless answer.downcase.start_with?('y')
    
end

prompt(MESSAGES['thanks'])































