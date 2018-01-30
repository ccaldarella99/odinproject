class Node
	attr_accessor :value, :parent, :childLeft, :childRight
	
	def initialize(value, parent)
		@value = value
		@parent = parent
		@childLeft = nil
		@childRight = nil
	end
	
	def set_childLeft(leftChild)
		@childLeft = leftChild
	end
	
	def get_childLeft
		@childLeft
	end
	
	def set_childRight(rightChild)
		@childRight = rightChild
	end
	
	def get_childRight
		@childRight
	end
	
	def set_parent(parent)
		@parent = parent
	end
	
	def get_parent
		@parent
	end
end

def breadth_first_search
	queue = []
end

def depth_first_search
end

def dfs_rec
end

def build_tree(array)
	current = Node.new(array[0], nil)
	last = current
	i = 1
	
	while(i < array.length)
		if(current.childRight == nil)
			current.childRight = Node.new(array[i], current)
		elsif(current.parent == nil)
			current.parent = Node.new(array[i], nil)
			last = current
			current = current.parent
			current.set_childLeft(last)
		end
		i += 1
	end
	
	p array
	
	while(current.childLeft != nil && current.childRight != nil )
		p current.value
		print current.childLeft.value
		print " - "
		p current.childRight.value
		current = current.childLeft
	end
end

array1 = [1, 4, 5, 7, 8, 9, 14, 23, 25, 37, 39, 67, 6345, 7324]
array2 = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

build_tree(array1)
