
input_array = [1,3,6,2,9,4,3,6,0,11]
arrayTwo = [1,3,6,2,9,4,3,6,11]

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
	inputArr.my_inject { |prod, z| prod*z }
end



def test_method(arr1)
	p arr1
#	_ret = arr1.my_each { |a| puts "Value #{a}" }
#	_ret = arr1.my_each_with_index { |a, i| puts "Index: #{i}, Value #{a}" }
#	_ret = arr1.my_select { |num| num.even? }
#	_ret = arr1.my_all? { |num| num > 0 }
#	_ret = arr1.my_any? { |num| num > 0 }
#	_ret = arr1.my_none? { |num| num > 11 }
#	_ret = arr1.my_count { |y| y%2==0 }
#	_ret = arr1.my_map { |i| i*i }
#	_ret = arr1.my_inject { |sum, n| sum * n }
end
def test_multiply_els(inArr)
	_ret = multiply_els(inArr)
	p _ret
end

test_multiply_els(arrayTwo)
#test_method(input_array)

system('pause')
