class Node
	attr_accessor :value, :parent, :childLeft, :childRight
	
	def initialize(value, parent)
		@value = value
		@parent = parent
		childLeft = nil
		childRight = nil
	end
end

def build_tree(array)
	
	head = Node.new(array[0], nil)
	current = head
	i = 1

#	puts current.value
	
	while(i < array.length)
		if(current.childLeft == nil)
			current.childLeft = Node.new(array[i], current)
			i += 1
#			puts current.childLeft.value
		elsif (current.childRight == nil)
			current.childRight = Node.new(array[i], current)
			i += 1
#			puts current.childRight.value
		elsif(current.parent != nil && current.parent.childRight.childLeft == nil)
			current = current.parent.childRight
		elsif(current.parent != nil && current.parent.childRight.childRight == nil)
			current = current.parent.childRight
		elsif(current.parent != nil && current.parent.childLeft.childLeft == nil)
			current = current.parent.childLeft
		elsif(current.parent != nil && current.parent.childLeft.childRight == nil)
			current = current.parent.childLeft
		elsif(current.childLeft.childLeft == nil)
			current = current.childLeft
		end
			
	end
	
	puts "        #{head.value}"
	puts "    #{head.childLeft.value}   |   #{head.childRight.value}"
	puts "#{head.childLeft.childLeft.value} | #{head.childLeft.childRight.value} | #{head.childRight.childLeft.value} | #{head.childRight.childRight.value}"
	
	puts " #{head.childRight.childLeft.childLeft.value} | #{head.childRight.childLeft.childRight.value} | #{head.childRight.childRight.childLeft.value} | #{head.childRight.childRight.childRight.value}"
	
	
end


array1 = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

build_tree(array1)
