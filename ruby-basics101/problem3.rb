LIMIT=13195
#LIMIT=600851475143
puts " Web-Dev 101 - RUBY BASICS - #3"
puts "--------------------------------"
puts "      Largest Prime Factor"
puts "--------------------------------"
puts "Find the largest prime factor of the number #{LIMIT}.\n\n"

def largestPrime(limit)
	largestPrime=1
	
	puts "The largest prime-factor of #{LIMIT} is: #{largestPrime}"
end


largestPrime(LIMIT)
system('pause')
