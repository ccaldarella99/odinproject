
def bubble_sort(arr1)
	_ret = arr1
	n = arr1.length-1
	i=0
	while(n>1)
		j = 0
		while(j<n)
			if (_ret[j] > _ret[n])
				_ret[j], _ret[n] = _ret[n], _ret[j]
			end
			j += 1
			i += 1
		end
		n -= 1
	end
	p _ret
	puts "Completed in #{i} cycles"
end

def bubble_sort_by(arr1)
	_ret = arr1
	n = arr1.length-1
	i=0
	while(n>1)
		j = 0
		while(j<n)
			result = yield(_ret[j], _ret[n])
			if result > 0
				_ret[j], _ret[n] = _ret[n], _ret[j]
			end
			j += 1
			i += 1
		end
		n -= 1
	end
	p _ret
	puts "Completed in #{i} cycles"
end


bubble_sort([4,3,78,2,0,2])
#=> [0,2,2,3,4,78]

#=begin
bubble_sort_by(["hi","hello","hey"]) do |left,right|
  left.length - right.length
end
#=> ["hi", "hey", "hello"]

system('pause')

