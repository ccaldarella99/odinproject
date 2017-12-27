
def stock_picker(arr1)
	_ret = []
	maxLength = arr1.length - 1
	maxInd = 1
	max = arr1[maxInd]
	minInd = 0
	min = arr1[minInd]
	
	i=0
	while(i < maxLength)
		if(max < arr1[i + 1])
			maxInd = i + 1
			max = arr1[maxInd]
#			puts "max: #{max}, #{maxInd}}"
		end
		if(min > arr1[i] && i < maxInd)
			minInd = i
			min = arr1[minInd]
#			puts "min: #{min}, #{minInd}"
		end
#		puts i
		i += 1
	end
	_ret << minInd
	_ret << maxInd
	
	p _ret
end

stock_picker([17,3,6,9,15,8,6,1,10])

#system('pause')
