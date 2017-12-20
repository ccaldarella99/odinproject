#LIMIT=13195
LIMIT=600851475143

puts " Web-Dev 101 - RUBY BASICS - #3"
puts "--------------------------------"
puts "      Largest Prime Factor"
puts "--------------------------------"
puts "Find the largest prime factor of the number #{LIMIT}.\n\n"


def findLargestPrime(limit)
	number = limit
	arr = []
	d = 2
	largestPrime = 1
	
	while number > 1
			while number % d == 0
				arr.push(d)
				number /= d
			end
			d += 1
			if d*d > number
				if number > 1
					arr.push(number)
					break
				end
			end
	end
	factors = arr.join(", ")
	puts "The prime-factors of #{LIMIT} are: #{factors}\n\n"
	puts "The largest prime-factor of #{LIMIT} is: #{arr[arr.length-1]}\n\n"
end

findLargestPrime(LIMIT)
system('pause')
