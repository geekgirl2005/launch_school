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