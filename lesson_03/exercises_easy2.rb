# Question 1
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.key?("Spot")
ages.include?("Spot")
ages.member?("Spot")

# Question 2
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
sum = 0
ages.each_value { |age| sum+= age }
p sum
sum1 = ages.values.inject(:+)
sum2 = ages.values.reduce(:+)
p sum1
p sum2

# Question 3
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.delete_if { |name, age| age > 100 }
p ages

# Question 4
munsters_description = "The Munsters are creepy in a good way."
p munsters_description.capitalize!
p munsters_description.swapcase!
p munsters_description.downcase!
p munsters_description.upcase!

# Question 5
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
p ages.merge!(additional_ages)

# Question 6
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
p ages.values.min

# Question 7
advice = "Few things in life are as important as house training you pet dinosaur."
p advice.include?("Dino")
p advice.match("Dino")

# Question 8
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.each_with_index { |name, index| puts "#{index}" if name.start_with?("Be") }
p flintstones.index { |name| name[0, 2] == "Be" }

# Question 9 & 10
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! {|name| name[0, 3]}
p flintstones
