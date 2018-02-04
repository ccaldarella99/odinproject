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

def build_tree(array)
	head = Node.new(array[0], nil)
  current = head
	last = current
	i = 1
  levels = 1
	
	while(i < array.length)
    if(array[i] < current.value)
      if(current.childLeft == nil)
        current.childLeft = Node.new(array[i], current)
        i += 1
        current = head
      else
        current = current.childLeft
      end
    else
      if(current.childRight == nil)
        current.childRight = Node.new(array[i], current)
        i += 1
        current = head
      else
        current = current.childRight
      end
    end
	end
  
  while(current.get_parent != nil)
    current = curent.get_parent
  end
  head = current
	
#  puts "\n\n"
#	p array
#  p 
  head
end

def breadth_first_search(tree, target)
  return nil if(tree.value == nil)
	queue = []
  current = tree
  queue << tree.value
  while(queue.length > 0)
    p queue
    if(current.childLeft != nil)
      queue << current.childLeft.value
#      breadth_first_search(current.childLeft, target)
    end
    if(current.childRight != nil)
      queue << current.childRight.value
#      breadth_first_search(current.childRight, target)
    end
#    if(current.childLeft == nil && current.childRight == nil)
#      return nil
#    end
    queue.shift
  end
  
end

def depth_first_search
end

def dfs_rec
end

array1 = [1, 4, 5, 7, 8, 9, 14, 23, 25, 37, 39, 67, 6345, 7324]
array2 = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

tree1 = build_tree(array1)
tree2 = build_tree(array2)

breadth_first_search(tree2, 14)
