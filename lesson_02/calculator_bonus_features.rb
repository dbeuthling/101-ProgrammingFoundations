# ask the user for two numbers
# ask the user for an operation to perform
# perfom the operation on the two numbers
# output the result

# answer = Kernel.gets()
# Kernel.puts(answer)
require 'pry'
require 'yaml'
MESSAGES  = YAML.load_file('calc_messages.yml')
#puts MESSAGES.inspect


def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
#  (num).to_i.kind_of? Integer #|| (num).kind_of? Float
#  /\d/.match(num) && /^\d*\.?\d*$/.match(num)
  /[^0123456789.]/ === num && num != '' && num != '.' && num.count('.') <= 1
#  num.to_i() != 0
end

def operation_to_message(op)
  puts case op
       when '1'
        'Adding'
       when '2'
        'Subtracting'
       when '3'
        'Mulitplying'
       when '4'
        'Dividing'
       end
end

prompt (MESSAGES['welcome'])
name = ''

loop do
  name = Kernel.gets().chomp()

  break unless name.empty?()
  prompt(MESSAGES['valid_name'])
end

prompt(MESSAGES['name_greeting1'] + "#{name}" + MESSAGES['name_greeting2'])

loop do # main loop
  number1 = ''
  number2 = ''

  loop do
    prompt(MESSAGES['first_number'])
    number1 = Kernel.gets().chomp()

    break unless valid_number?(number1) #== false
    prompt(MESSAGES['valid_number'])
  end

  loop do
    prompt(MESSAGES['second_number'])
    number2 = Kernel.gets().chomp()

    break unless valid_number?(number2) #== false
    prompt(MESSAGES['valid_number'])
  end
#  operator_prompt = <<-message
#    What operation would you like to perform?
#    1) add
#    2) subtract
#    3) multiply
#    4) divide
# =>  message
  prompt(MESSAGES['operation'])

  operator = ''

  loop do
    operator = Kernel.gets().chomp()

    break unless %w(1 2 3 4).include?(operator) == false
    prompt(MESSAGES['valid_operator'])
  end

  prompt("#{operation_to_message(operator)}" + MESSAGES['operation_message'])

  result = case operator
           when '1'
             number1.to_f() + number2.to_f()
           when '2'
             number1.to_f() - number2.to_f()
           when '3'
             number1.to_f() * number2.to_f()
           when '4'
             number1.to_f() / number2.to_f()
           end

  prompt(MESSAGES['result'] + "#{result}.")

  prompt(MESSAGES['repeat'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(MESSAGES['exit'])
