class Node
	attr_accessor :value, :parent, :childLeft, :childRight
	
	def initialize(value, parent)
		@value = value
		@parent = parent
		childLeft = nil
		childRight = nil
	end
  
end

def depth_first_search
end

def dfs_rec
end

def build_tree(array)
	head = Node.new(array[0], nil)
	current = head
	i = 1

 	while(i < array.length)
    if(current.value > array[i] )
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
	
  p array
	puts "                   #{head.value}"
	puts "                   |        #{head.childRight.value}"
	puts "          |            #{head.childRight.childLeft.value}   |   #{head.childRight.childRight.value}"
	
#	print "    #{head.childLeft.childLeft.childLeft.value} | #{head.childLeft.childLeft.childRight.value}  "#{head.childLeft.childRight.childLeft.value} | #{head.childLeft.childRight.childRight.value}"
  print "       |     |      "
	puts " #{head.childRight.childLeft.childLeft.value} | #{head.childRight.childLeft.childRight.value}   #{head.childRight.childRight.childLeft.value} | #{head.childRight.childRight.childRight.value}"
  print "    |     |     |   "
	puts " |   |   |    | #{head.childRight.childRight.childRight.childRight.value}"
  print "  |   | |   | |   |"
	puts "|  | | | | |  |   | #{head.childRight.childRight.childRight.childRight.childLeft.value}"


  #	puts "           #{head.childLeft.value}       |        #{head.childRight.value}"
#	puts "       #{head.childLeft.childLeft.value}  |  #{head.childLeft.childRight.value}         #{head.childRight.childLeft.value}   |   #{head.childRight.childRight.value}"
	
#	print "    #{head.childLeft.childLeft.childLeft.value} | #{head.childLeft.childLeft.childRight.value}  "#{head.childLeft.childRight.childLeft.value} | #{head.childLeft.childRight.childRight.value}"
#  print "         "
#	puts " #{head.childRight.childLeft.childLeft.value} | #{head.childRight.childLeft.childRight.value}   #{head.childRight.childRight.childLeft.value} | #{head.childRight.childRight.childRight.value}"
	
	
end


array1 = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

build_tree(array1)
