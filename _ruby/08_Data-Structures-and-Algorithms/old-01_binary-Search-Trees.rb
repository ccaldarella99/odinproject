class Node
	attr_accessor :value, :parent, :childLeft, :childRight, :has_root, :is_root
	
	def initialize(value, parent)
		@value = value
		@parent = parent
		childLeft = nil
		childRight = nil
		@@has_root = false
		@is_root = false
	end
  
  def has_left?
    return true if(self.childLeft)
    false
  end
  
  def has_right?
    return true if(self.childRight)
    false
  end
	
end


def build_tree(array)
	head = Node.new(array[0], nil)
	current = head
	i = 1
  level = 1

	while(i < array.length)
		puts "Level: #{level}, Has Left: #{current.has_left?}, Has Right: #{current.has_right?}"
    
    if(current.childLeft == nil)
			current.childLeft = Node.new(array[i], current)
			i += 1
			puts "Add Left"#current.childLeft.value
		elsif (current.childRight == nil)
			current.childRight = Node.new(array[i], current)
			i += 1
			puts "Add Right"#current.childRight.value
      current = head
			level = 1
		elsif(current.parent != nil && current.parent.childRight.childLeft == nil)
			current = current.parent#.childRight
      level -= 1
      puts "Go up one level; Right, then Left is available"
		elsif(current.parent != nil && current.parent.childRight.childRight == nil)
			current = current.parent#.childRight
      level -= 1
      puts "Go up one level; Right, then Right is available"
		elsif(current.parent != nil && current.parent.childLeft.childLeft.childLeft == nil)
			current = current.parent.childLeft.childLeft
      level += 1
      puts "Go up one level; Left, then Left is available"
		elsif(current.parent != nil && current.parent.childLeft.childLeft.childRight == nil)
			current = current.parent.childLeft.childLeft
      level += 1
      puts "Go up one level; Left, then Right is available"
		elsif(current.childLeft.childLeft == nil)
			current = current.childLeft
      level += 1
      puts "Go down one level, to the Left"
		else#if(current.childRight.childLeft == nil)
			current = current.childRight
      level += 1
      puts "Go down one level, to the Right"
		end
	end
	
  p array
	puts "                   #{head.value}"
	puts "           #{head.childLeft.value}       |        #{head.childRight.value}"
	puts "       #{head.childLeft.childLeft.value}  |  #{head.childLeft.childRight.value}         #{head.childRight.childLeft.value}   |   #{head.childRight.childRight.value}"
	
	print "    #{head.childLeft.childLeft.childLeft.value} | #{head.childLeft.childLeft.childRight.value}  "#{head.childLeft.childRight.childLeft.value} | #{head.childLeft.childRight.childRight.value}"
  print "         "
	puts " #{head.childRight.childLeft.childLeft.value} | #{head.childRight.childLeft.childRight.value}   #{head.childRight.childRight.childLeft.value} | #{head.childRight.childRight.childRight.value}"
	
	
end


array1 = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

build_tree(array1)
