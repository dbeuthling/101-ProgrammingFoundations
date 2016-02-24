# Question 1
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Question 2
flintstones << "Dino"
p flintstones

# Question 3
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.push("Dino", "Hoppy")
p flintstones

# Question 4
advice = "Few things in life are as important as house training your pet dinosaur."
p advice.slice!(0, advice.index("house"))
p advice
# removing the ! leave the value of advice unchanged

# Question 5
statement = "The Flintstones Rock!"
p statement.count("t")
p statement.scan("t").count

# Question 6
title = "Flintstones Family Members"
p title.center(40)
