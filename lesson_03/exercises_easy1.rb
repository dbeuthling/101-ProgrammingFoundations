# Question 1
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# prints original array to screen. .uniq does not mutate the caller
# .uniq! does

#Question 2

# ! and ? use depend on the method using them ! usually indicates a modified caller
# ? calles for a boolean result
# ? also is part of a if else statement - doesn't do anything before or after variable?
# ! in front of something inverts the boolean value
# !! in front turns it into the boolean value
# !=  means does not equal
!user_name = false
!!user_name = true

# Question 3

advice = "Few things in life are as important as house training your pet dinosaur."
advice.gsub!("important", "urgent")
p advice

# Question 4

numbers = [1, 2, 3, 4, 5]
numbers.delete_at(1) # deletes 2 because it is in the 1 item position
numbers.delete(1) # deltes 1

# Question 5

(10..100).cover?(42)

#Question 6

famous_words = "seven years ago..."
famous_words.insert(0, "Four score and ")
famous_words.prepend("Four score and ")

# Question 7
def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep
p eval(how_deep)

# Question 8

flinstones = ['Fred', 'Wilma']
flinstones << ['Barney', 'Betty']
flinstones << ['BamBam', 'Pebbles']
p flinstones
p flinstones.flatten!

# Question 9

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
flintstones.keep_if { |k,v| k == 'Barney' }
flintstones.assoc("Barney")
p flintstones

# Question 10

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flintstones_hash = Hash.new
flintstones.each_with_index { |name, index| flintstones_hash[name] = index }
p flintstones_hash

