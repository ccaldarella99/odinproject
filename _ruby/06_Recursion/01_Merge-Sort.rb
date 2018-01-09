
array1 = [1,2,3,4,5,6,7,8]
array2 = [8,7,6,5,4,3,2,1]
array3 = [6,5,3,1,8,7,2,4,12]
array4 = [1,2,2,9,5,22,4,11,16,4,5]
array5 = [3,26,13,8,4,19,16,4,5,9,3,13]

def merge_sort(fullArr)
	len = fullArr.length
	return fullArr.flatten if(len == 1)
	
	len1 = len/2
	len2 = len/2
	
	arr1 = fullArr[0..(len1-1)].flatten
	arr2 = fullArr[len2..fullArr.length-1].flatten
	newArr = []
	newArr1 = []
	newArr2 = []

	if(len1 == 1 && len2 == 1)
		arr1.flatten!
		arr2.flatten!
		if(arr1[0] > arr2[0])
			return [arr2, arr1]
		else
			return [arr1, arr2]
		end
	end
	newArr1 << merge_sort(arr1)
	newArr2 << merge_sort(arr2)
	newArr1.flatten!
	newArr2.flatten!

	if(newArr1 != [nil] || newArr2 != [nil])
		i=0
		while (i<len && newArr1.length > 0 && newArr2.length > 0)# && (newArr1[0] != nil || newArr2[0] != nil))
			if(newArr1 == [nil] || newArr2 == [nil])
				break
			elsif(newArr1[0] > newArr2[0])
				newArr << newArr2.shift
			elsif(newArr1[0] <= newArr2[0])
				newArr << newArr1.shift
			end
			
			if(newArr1 == [])
				newArr << newArr2
			end
			if(newArr2 == [])
				newArr << newArr1
			end
			
			i += 1
#			p i
#			p newArr
#			p newArr1
#			p newArr2
		end
	end
	
	newArr#.flatten!
end

p array1
p array2
p array3
p array4
p array5
puts "\n\n"

p merge_sort(array1)
p merge_sort(array2)
p merge_sort(array3)
p merge_sort(array4)
p merge_sort(array5)

#system('pause')
