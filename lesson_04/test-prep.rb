# require 'pry'
# arr = [1, 2, 3, 4, 5]

# rev = [arr[4], arr[3], arr[2], arr[1], arr[0]]

# def reverse(array)
#   new_arr = []
#   loop do
#     new_arr << array.pop
#     break if array == []
#   end
#   new_arr
# end

# p reverse(arr)


# def fizzbuzz(first, last)
#   fb_array = (first..last).to_a
#   fb_array.map do |num|
#     if num % 3 == 0 && num % 5 == 0
#       num = "FizzBuzz"
#     elsif num % 3 == 0
#       num = "Fizz"
#     elsif num % 5 == 0
#       num = "Buzz"
#     else num
#     end
#   end
# end

# puts fizzbuzz(1, 15).to_s


# PRODUCTS = [
#   {name: "Thinkpad x210", price: 220 },
#   {name: "Thinkpad x220", price: 250 },
#   {name: "Thinkpad x250", price: 979 },
#   {name: "Thinkpad x230", price: 300 },
#   {name: "Thinkpad x230", price: 350 },
#   {name: "Thinkpad x240", price: 700 },
#   {name: "Macbook Leopard", price: 300 },
#   {name: "Macbook Air", price: 700 },
#   {name: "Macbook Pro", price: 600 },
#   {name: "Macbook", price: 1449 },
#   {name: "Dell Latitude", price: 200 },
#   {name: "Dell Latitude", price: 650 },
#   {name: "Dell Inspiron", price: 300 },
#   {name: "Dell Inspiron", price: 450 },
# ]

# query = {
#   price_min: 240,
#   price_max: 280,
#   q: 'thinkpad'
# }

# query2 = {
#   price_min: 300,
#   price_max: 450,
#   q: 'dell'
# }




# def search(query)
#   PRODUCTS.select do |hash|
#     arr = []
#     p arr << hash if (query[:price_min]..query[:price_max]).include?(hash[:price]) &&
#                      (hash[:name].downcase.include?(query[:q]))
#   end
# end



#   search(query)
#   search(query2)

# words = ['green', 'yellow', 'black', 'white']

# def no_vowels(words)
#   words.each do |word|
#     word.gsub!(/[aeiou]/, "")
#   end
# end

# p no_vowels(words)

# def balancer?(arg)
  # arg = "(#{arg})"
#   arg.count("(") == arg.count(")")




# end

# p balancer?("hi")
# p balancer?("(hi")
# p balancer?("(hi)")
# p balancer?(")hi(")

# def find_prime(num)
#   (2..(num - 1)).each do |divisor|
#      return false if num % divisor == 0
#   end
#   true
# end



# def find_primes(first, last)
#   numbers = (first..last).to_a
#   numbers.select do |num|
#      find_prime(num)


    
#   end
# end

# p find_primes(3, 10)


# def fib?(num)
#   fib_array = [0, 1, 1, 2]
#   loop do
#     last = fib_array.last
#     last_index = fib_array.index(last)
#     fib_array << (last + fib_array[last_index - 1])
#     break if last > num
#   end
#   fib_array.include?(num)
# end



# def contain_fibs(array)
#   new_arr = []
#   array.each_index do |index|
#     new_arr << array[index] if fib?(index)
#   end
#   new_arr
# end

# arr = [0, 1, 2, 4, 5, 9, 13, 22, 309875, 208745092843570982745028947509854273, 3, 235, 234, 45, 78, 3,42,3 ,234343324,23434,234,234234,294,342,34,5858528,53,85,3,853,8,3,853,8,53,85,3,853,5,3,85,385,3,85,38,53,85,3,85,3,85,385,38,3,8,3,85,3,8,53,85,38,53,85,3,853,8,5,3,85,38,53,85,3853853,85,3858,853,853]
# p contain_fibs(arr)

def reverse(arr)
  rev = []
  loop do
    rev << arr.pop
    break if arr.empty?
  end
  rev
end

# reverse(["pickles", 4, 3, 2, 1])
# reverse(['up', 'warming', 'is', 'world', 'this'])

def palindrome?(word)
  letters = word.chars
  reversal = reverse(letters).join("")
  if word.downcase == reversal.downcase
     puts "Palindrome! - #{word} is the same as #{reversal}."
  else
     puts "Not a palindrome - #{word} is different from #{reversal}."
   end
end


palindrome?('hello')
palindrome?('Kayak')
palindrome?("GoHangASalamiImALasagnaHOg")