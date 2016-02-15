# ask the user for two numbers
# ask the user for an operation to perform
# perfom the operation on the two numbers
# output the result

# answer = Kernel.gets()
# Kernel.puts(answer)

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i() != 0
end

def operation_to_message(op)
  case op
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

prompt("Welcome to Calculator! Enter your name.")
name = ''

loop do
  name = Kernel.gets().chomp()

  break unless name.empty?()
  prompt("I didn't catch your name.")
end

prompt("Hello #{name}, let's calculate.")

loop do # main loop
  number1 = ''
  number2 = ''

  loop do
    prompt("What is the first number?")
    number1 = Kernel.gets().chomp()

    break unless valid_number?(number1) == false
    prompt("That doesn't look like a valid number!")
  end

  loop do
    prompt("What is the second number?")
    number2 = Kernel.gets().chomp()

    break unless valid_number?(number2) == false
    prompt("That doesn't look like a valid number.")
  end
  operator_prompt = <<-message
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  message
  prompt(operator_prompt)

  operator = ''

  loop do
    operator = Kernel.gets().chomp()

    break unless %w(1 2 3 4).include?(operator) == false
    prompt("Must choose 1 2 3 or 4")
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
             number1.to_i() / number2.to_f()
           end

  prompt("The result is #{result}.")

  prompt("Do you want to use the Calculator again? (Y to calculate again.)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank for calculating!")
