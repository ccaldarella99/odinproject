
array1 = [1,3,6,2,9,4,3,6,0,11]
array2 = [1,3,6,2,9,4,3,6,11]
array3 = [2,2,4,8]
array4 = [1,2,3,4,5]
array5 = [-1,-2,-3,-4,-5]

module Enumerable
	def my_each
		return to_enum(__method__) {size} unless block_given?
		i = 0
		self.size.times do
			yield self[i]
			i += 1
		end
		self
	end
	
	def my_each_with_index
		return to_enum(__method__) {size} unless block_given?
		i = 0
		self.size.times do
			yield [self[i], i]
			i += 1
		end
		self
	end
	
	def my_select
		return to_enum(__method__) unless block_given?
		new_arr = []
		self.my_each do |x|
			new_arr << x if yield x
		end
		new_arr
	end
	
	def my_all?
		return true unless block_given?
		self.my_each do |x|
			return false unless yield x
		end
		true
	end
	
	def my_any?
		return true unless block_given?
		self.my_each do |x|
			return true if yield x
		end
		false
	end
	
	def my_none?
		return false unless block_given?
		self.my_each do |x|
			return false if yield x
		end
	end
	
	def my_count
		self.size
	end
	
	def my_map
		return to_enum(__method__) {size} unless block_given?
		new_arr = []
		self.my_each do |x|
			new_arr << yield(x)
		end
		new_arr
	end
	
	def my_inject(acc = nil)
		#return to_enum(__method__) {size} unless block_given?
		copy = self.dup
		acc ||=copy.shift
		copy.my_each do |x|
			acc = yield(acc,x)
		end
		acc
	end
end




def multiply_els(inputArr)
	#Leave this here
	p inputArr.my_inject { |prod, n| prod * n }
end

def test_method(arrIn)
	#Leave this here
#	p arrIn
#	_ret = arrIn.my_each { |a| puts "Value #{a}" }
#	_ret = arrIn.my_each_with_index { |a, i| puts "Index: #{i}, Value #{a}" }
#	_ret = arrIn.my_select { |num| num.even? }
#	_ret = arrIn.my_all? { |num| num > 0 }
#	_ret = arrIn.my_any? { |num| num > 0 }
#	_ret = arrIn.my_none? { |num| num > 0 }
#	_ret = arrIn.my_count { |y| y%2==0 }
#	_ret = arrIn.my_map { |i| i*i }
	_ret = arrIn.my_inject { |sum, n| sum + n }
	p _ret
end


#multiply_els(array1)
#multiply_els(array2)
#multiply_els(array3)
#multiply_els(array4)
#multiply_els(array5)
#
#puts ""
#
#test_method(array1)
#test_method(array2)
#test_method(array3)
#test_method(array4)
#test_method(array5)
#
#system('pause')
