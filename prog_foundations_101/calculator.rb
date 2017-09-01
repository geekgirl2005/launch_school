require "pry"
require 'yaml'
MESSAGES = YAML.load_file('messages.yml')
# ask user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the results
# test


def prompt(message)
  puts("=> #{message}")
end
#/^\s*(?=.*[1-9])\d*(?:\.\d{1,2})?\s*$/.match(input) 
#/^[-+]?[0-9]*\.?[0-9]+$/.match(input) 

# Start of string ^            
# Optional whitespace \s*          
# Assert that at least one digit > 0 is present in the string (?=.*[1-9])  
# integer part (optional) \d*          
# decimal part: (?:          
# dot \.          
# plus one or two decimal digits \d{1,2}     
# (optional) )?           
# Optional whitespace \s*          
# End of string $

def integer?(input)
  #/^\s*[-+]?(?=.*[1-9])\d*(?:\.\d{1,2})?\s*$/.match(input) 
  /^\s*[-+]?(?=.*[1-9])?[0-9]{1,2}*\.?[0-9]{1,2}$/.match(input) 
end

def operation_to_message(operation)
  case operation
           when '1'
             'Adding'
           when '2'
             'Subtracting'
           when '3'
             'Multiplying'
           when '4'
             'Dividing'
         end
end


def integer?(input)
  /^\s*[-+]?(?=.*[1-9])\d*(?:\.\d{1,2})?\s*$/.match(input) 
end

def operation_to_message(operation)
  case operation
           when '1'
             'Adding'
           when '2'
             'Subtracting'
           when '3'
             'Multiplying'
           when '4'
             'Dividing'
         end
end

def validation(two)
  
end

integer_one = ''
integer_two = ''
operator = ''
answer = ''
operator_prompt = <<-MSG

  What operation do you want to perform?
    1. Add
    2. Substract
    3. Multiply
    4. Divide
MSG

prompt(MESSAGES['welcome'])

loop do
  
  loop do
    prompt(MESSAGES['first_number'])
      integer_one = gets.chomp
      break if integer?(integer_one)
    prompt(MESSAGES['invalid_num'])
    end

    loop do
      prompt(MESSAGES['second_number'])
      
      integer_two = gets.chomp
      break if integer?(integer_two)
      prompt(MESSAGES['invalid_num'])
    end

    prompt(operator_prompt)

    loop do
      operator = gets.chomp
        break if %w(1 2 3 4).include?(operator)
      prompt(MESSAGES['enter_operation'])
    end
   
    result = case operator
    when '1' 
      integer_one.to_f + integer_two.to_f
    when '2' 
      integer_one.to_f - integer_two.to_f
    when '3' 
      integer_one.to_f * integer_two.to_f
    when '4'
      integer_one.to_f / integer_two.to_f
end
    
    prompt(operation_to_message(operator))
    prompt("Your result is #{result.to_f.round(2)}")
    
   
prompt(MESSAGES['play_again'])
answer = gets.chomp
break unless answer.downcase.start_with?('y')

end




