# mortgage_calc.rb

require 'yaml'
MESSAGES = YAML.load_file('mortgage_calc_messages.yml')

def prompt(message)
  puts("=> #{message}")
end

def valid_number?(num)
  # num =~ /^(([0-9]{1,3}(,?[0-9])*)(\.[0-9]+|\.)?|\.[0-9]+)$/
  num.empty?() || num.to_f() <= 0
end

loan_amount = ''
apr = ''
duration = ''

loop do
  loop do
    prompt MESSAGES['loan_amt']
    loan_amount = gets.chomp
    break unless valid_number?(loan_amount)
    prompt MESSAGES['valid_number']
  end

  loop do
    prompt MESSAGES['apr']
    apr = gets.chomp
    break unless valid_number?(apr)
    prompt MESSAGES['valid_number']
  end

  loop do
    prompt MESSAGES['duration']
    duration = gets.chomp
    break unless valid_number?(duration)
    prompt MESSAGES['valid_number']
  end

  loan_amount = loan_amount.to_i
  monthly_rate = (apr.to_f / 100) / 12

  monthly_duration = (duration.to_i * 12)
  monthly_payment = (loan_amount * ((monthly_rate * (1 + monthly_rate)**monthly_duration)) / (((1 + monthly_rate)**monthly_duration) - 1)).round(2)

  puts "You are borrowing $#{loan_amount} at #{apr}% for #{monthly_duration} months."
  puts "Your monthly payment will be $#{monthly_payment}"

  prompt MESSAGES['calc_again']
  calc_again = gets.chomp.downcase
  break unless calc_again.start_with?('y')
end
prompt MESSAGES['bye']
