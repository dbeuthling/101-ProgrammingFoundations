# mortgage_calc.rb

require 'yaml'
MESSAGES  = YAML.load_file('mortgage_calc_messages.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def is_number?(num)
  num =~ /^((-|\+?)([0-9]{1,3}(,?[0-9])*)(\.[0-9]+|\.)?|\.[0-9]+)$/
end

loan_amount = ''
apr = ''
duration = ''

loop do
  prompt (MESSAGES['loan_amt'])
  loan_amount = gets.chomp
  break unless is_number?(loan_amount) == nil
  prompt (MESSAGES['valid_number'])
end

loop do
  prompt (MESSAGES['apr'])
  apr = (gets.chomp)
  break unless is_number?(apr) == nil
  prompt (MESSAGES['valid_number'])
end

loop do
  prompt (MESSAGES['duration'])
  duration = gets.chomp
  break unless is_number?(duration) == nil
  prompt (MESSAGES['valid_number'])
end

loan_amount = loan_amount.to_i
monthly_rate = (apr.to_f / 100) / 12

monthly_duration = (duration.to_i * 12)
monthly_payment = (loan_amount * ((monthly_rate * (1 + monthly_rate) ** monthly_duration)) / (((1 + monthly_rate) ** monthly_duration) - 1)).round(2)

puts "You are borrowing $#{loan_amount} at #{apr}% for #{monthly_duration} months."
puts "Your month payment will be $#{monthly_payment}."
