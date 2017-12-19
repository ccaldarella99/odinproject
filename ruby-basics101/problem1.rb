LIMIT = 1000
puts " Web-Dev 101 - RUBY BASICS - #1"
puts "--------------------------------"
puts "      Multiples of 3 and 5"
puts "--------------------------------"
puts "Find the sum of all the multiples of 3 or 5 below #{LIMIT}.\n\n"

def mult3and5(limit)
	verbose=false
	sum=0
	limit = limit-1
	if(verbose)
		puts "SUM: #{sum}"
	end
	for i in 1..limit do
		if(i%3 == 0)
			if(i%5 == 0)
				sum = sum + i
				if(verbose)
					puts "Add multiple of 15, sum = #{sum}"
				end
			else
				sum = sum + i
				if(verbose)
					puts "Add multiple of 3, sum = #{sum}"
				end
			end
		elsif(i%5 ==0)
				sum = sum + i
				if(verbose)
					puts "Add multiple of 5, sum = #{sum}"
				end
 		end
	end
	puts "The sum of 3s and 5s under #{LIMIT} is: #{sum}"
end


mult3and5(LIMIT)
system('pause')
