# Question 1
10.times { |count| puts (" " * count) + "The Flintstones Rock!" }

# Question 2
statement = "The Flintstones Rock"
hash = Hash.new
statement.each_char do |chr|
  if hash.has_key?(chr)
    hash[chr] = hash[chr] + 1
  else
    hash[chr] = 1
  end
end
p hash

result = Hash.new
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_count = statement.scan(letter).count
  result[letter] = letter_count if letter_count > 0
end
p result

# Question 3
# puts "the value of 40 + 2 is" + (40 + 2)
puts "the value of 40 + 2 is #{(40 + 2)}"
puts "the value of 40 + 2 is " + (40 + 2).to_s

# Question 4
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# when you modify an array while iterating over it, you
# will encounter unexpected results. The iterator will be working
# on a modified version of the original array.

# Question 5
def factors(number)
  dividend = number
  divisors = []
  while dividend > 0 do
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
#  loop do
#    break if number <= 0 || dividend == 0
#    divisors << number / dividend if number % dividend == 0
#    dividend -= 1
#  end
  divisors
end
p factors(-9)

# Question 6
# First implementation has buffer as an argument with the second has the
# input_array. The second method will always start with original array input,
# not a modified version.

# Question 7
limit = 15

def fib(first_num,second_num)
  limit = 22
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end
result = fib(0, 1)
puts "result is #{result}"

# Question 8
def titalize(title)
  array = title.split
  array.each { |word| word.capitalize! }
  p array.join(" ")
end

titalize("this is a test.")

words = "this is another test"
p words.split.map { |word| word.capitalize!}.join(" ")

# Question 9
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

#munsters.each do |name, hash|
#  if hash["age"].to_i.between?(0, 17)
#    hash["age_group"] = "kid"
#  elsif hash["age"].to_i.between?(18, 64)
#    hash["age_group"] = "adult"
#  else hash["age_group"] = "senior"
#  end
#end

munsters.each do |name, hash|
  case hash["age"].to_i
  when (0...18)
    hash["age_group"] = "kid"
  when (18...65)
    hash["age_group"] = "adult"
  else
    hash["age_group"] = "senior"
  end
end

p munsters
