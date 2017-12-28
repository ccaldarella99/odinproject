
def bubble_sort(arr1)
	_ret = arr1
	n = arr1.length
	
	while(n > 0)
		newN=0
		j=1
		while(j<n)
			if(_ret[j-1] > _ret[j])
				_ret[j-1], _ret[j] = _ret[j], _ret[j-1]
				newN = j
			end
			 j += 1
		end
		n = newN
	end
	p _ret
end

def bubble_sort_by(arr1)
	_ret = arr1
	n = arr1.length
	
	while(n > 0)
		newN = 0
		j = 1
		while(j < n)
			result = yield(_ret[j-1], _ret[j])
			if result > 0
				_ret[j-1], _ret[j] = _ret[j], _ret[j-1]
			end
			newN = j
			j += 1
		end
		n = newN
	end
	p _ret
end


bubble_sort([4,3,78,2,0,2])
#=> [0,2,2,3,4,78]

#=begin
bubble_sort_by(["hi","hello","hey"]) do |left,right|
  left.length - right.length
end
#=> ["hi", "hey", "hello"]

#system('pause')

