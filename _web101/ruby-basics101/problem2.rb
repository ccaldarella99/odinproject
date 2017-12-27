LIMIT = 4000000
puts " Web-Dev 101 - RUBY BASICS - #2"
puts "--------------------------------"
puts "     Even Fibonacci Numbers"
puts "--------------------------------"
puts "Consider the terms in the Fibonacci sequence whose values do not exceed #{LIMIT}, find the sum of the even-valued terms.\n\n"

def evenFibonacci(limit)
	verbose=false

	theEvenOnes=0
	theCurrentOne=1
	thePreviousOne=1
	andTheOneBeforeThat=0

	while theCurrentOne < limit
		andTheOneBeforeThat = thePreviousOne
		thePreviousOne = theCurrentOne
		theCurrentOne = thePreviousOne + andTheOneBeforeThat
		if (theCurrentOne % 2 == 0)
			theEvenOnes += theCurrentOne
		end
	end
	puts "The sum of the even Fibonacci Sequence terms under #{limit} is: #{theEvenOnes}"
end


evenFibonacci(LIMIT)
system('pause')
