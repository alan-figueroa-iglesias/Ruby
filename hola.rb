###############
# FizzBuzz
#
# 3 y 5 FizzBuzz
# 3 Fizz
# 5 Buzz
# 
# 1 < 100
# ie Output
# 3 - Fizz
# 5 - Buzz
# 6 - Fizz
# 9 - Fizz
# 10 - Buzz
# ...
# 15 - FizzBuzz

for i in (1..100)
	if i%5 == 0 && i%3 == 0
		puts "#{i} => FizzBuzz"
	elsif i%5 == 0
		puts "#{i} => Buzz"	
	elsif i%3 == 0
		puts "#{i} => Fizz"

	end
end