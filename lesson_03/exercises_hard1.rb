require "securerandom"

# Question 1
if false
  greeting = "hello world"
end

p greeting # nil

# Question 2
greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting
puts greetings # "hi there" informal_greeting references greetings and << modifies

# Question 3
# A)
def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # "one" these are different objects than those in method
puts "two is: #{two}" # "two"
puts "three is: #{three}" # "three"

# B)
def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # "one" still different objects - not mutilating caller
puts "two is: #{two}" # "two"
puts "three is: #{three}" # "three"

# C)
def mess_with_vars(one, two, three)
  one.gsub!("one","two") # mutating the caller!
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)
puts "one is: #{one}" # "two" <- these are change because the method references the caller. Same objects.
puts "two is: #{two}" # "three"
puts "three is: #{three}" # "one"

# Question 4
require "securerandom"

def uuid
  SecureRandom.uuid
end
p uuid

def uuid2
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |letter| characters << letter }

  uuid2 = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid2 += characters.sample }
    uuid2 += '-' unless index == 4

  end

p uuid2
end

uuid2

# Question 5
def is_a_number?(string)
  string !~ /\D/
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size == 4 do
    word = dot_separated_words.pop
    return is_a_number?(word)
  end
  false
end


p dot_separated_ip_address?("10.36.55.36")
