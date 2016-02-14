#ask the user for two numbers
#ask the user for an operation to perform
#perfom the operation on the two numbers
#output the result

#answer = Kernel.gets()
#Kernel.puts(answer)

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_nubmer?(num)
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

  if name.empty?()
    prompt("I didn't catch your name.")
  else
    break
  end
end

prompt("Hello #{name}, let's calculate.")

loop do #main loop


  number1 = nil
  number2 = ''

  loop do
    prompt("What is the first number?")
    number1 = Kernel.gets().chomp()

    if valid_nubmer?(number1)
      break
    else
      prompt("That doesn't look like a valid number.")
    end
  end


  loop do
    prompt("What is the second number?")
    number2 = Kernel.gets().chomp()

    if valid_nubmer?(number2)
      break
    else
      prompt("That doesn't look like a valid number.")
    end
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

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1 2 3 or 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
  when '1'
    #prompt("Adding!")
    number1.to_i() + number2.to_i()
  when '2'
    #prompt("Subtracting!")
    number1.to_i() - number2.to_i()
  when '3'
    #prompt("Mulitplying!")
    number1.to_i() * number2.to_i()
  when '4'
    #prompt("Dividing!")
    number1.to_i() / number2.to_f()
  end

  prompt("The result is #{result}.")

  prompt("Do you want to use the Calculator again? (Y to calculate again.)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank for calculating!")
