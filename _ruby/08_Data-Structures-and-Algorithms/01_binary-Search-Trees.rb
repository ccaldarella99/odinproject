class Tree
	attr_accessor :root
  
	def initialize
    @root = nil
	end
  
  def build_Tree(array)
    @root = Node.new(array[0])
    array[1..-1].each_with_index do | v, i |
      puts "Step: " + (i+1).to_s
      insert(@root, Node.new(v))
    end
  end
  
  def insert(current, new_node)
    if(new_node.value >= current.value)
      puts "New Node, " + new_node.value.to_s + ", is greater than current node, " + current.value.to_s
      if(current.right == nil)
        current.set_right(new_node)
        new_node.set_parent(current)
        puts "New Node, " + new_node.value.to_s + ", is set RIGHT to current node, " + current.value.to_s
        return
      else
        insert(current.right, new_node)
      end
    elsif(new_node.value < current.value)
      puts "New Node, " + new_node.value.to_s + ", is less than current node, " + current.value.to_s
      if(current.left == nil)
        current.set_left(new_node)
        new_node.set_parent(current)
        puts "New Node, " + new_node.value.to_s + ", is set LEFT to current node, " + current.value.to_s
        return
      else
        insert(current.left, new_node)
      end
    end
  end
  
  def show(root=@root)
    current = root
    p current.to_s if(root == @root)
    if(current.left != nil)
#      puts "#{current.to_s} <- #{current.left.to_s}"
      puts current.left.to_s
      show(current.left)
    end
    if(current.right != nil)
#      puts "#{current.to_s} ->  #{current.right.to_s}"
      puts current.right.to_s
      show(current.right)
    end
  end
	
  class Node
    attr_accessor :value, :parent, :left, :right
    
    def initialize(value)
      @value = value
      set_left(nil)
      set_right(nil)
      set_parent(nil)
    end
	
    def set_left(leftChild)
      @left = leftChild
    end

    def get_left
      @left
    end

    def set_right(rightChild)
      @right = rightChild
    end

    def get_right
      @right
    end

    def set_parent(parent)
      @parent = parent
    end

    def get_parent
      @parent
    end
    
    def to_s
      @value
    end
  end
  
  def breadth_first_search(target, current=@root)
    lvl_root = []
    lvl_root << @root
    found = false
	stay_while = true
    while(!found && stay_while)
      lvl_arr = []
	  lvl_root.each do |current|
		  puts current.to_s
		  if(target == current.value)
			p current.to_s
			found = true
			stay_while = false
			break;
		  end
		  if(current.left != nil)
			lvl_arr << current.left
	      end
		  if(current.right != nil)
			lvl_arr << current.right
		  end
		  if(current.right == nil && current.left == nil)
			found = false
		    break
		  end
	  end
	  if(lvl_arr == [])
	    break
	  end
	  lvl_root = lvl_arr
	  lvl_arr = []
    end
    if(not found)
      puts "Number #{target} not found"
    else
      puts "#{target} found at #{current}"
    end
  end

  def depth_first_search(target)
	current = @root
	found = false
	while(!found)
		puts current.to_s
		if(target == current.value)
			p current.to_s
			found = true
			break;
		end
		if(current.left != nil && target < current.value)
			current = current.left
		elsif(current.right != nil && target > current.value)
			current = current.right
		else
			found = false
			break
		end
	end
	if(not found)
		puts "Number #{target} not found"
	else
		puts "#{target} found at #{current}"
	end
  end

  def dfs_rec(target, current=@root)
    puts current.to_s
    found = false
    if(target == current.value)
      p current.to_s 
      found = true
      return true
	end
    if(current.left != nil && target < current.value)
#      puts current.left.to_s
      found = dfs_rec(target, current.left)
    elsif(current.right != nil && target > current.value)
#      puts current.right.to_s
      found = dfs_rec(target, current.right)
    end
    if(current == root)
      if(not found)
        puts "Number #{target} not found"
        return false
      else
        puts "#{target} found at #{current}"
        return true
      end
    end
	found
  end
end

array1 = [1, 4, 5, 7, 8, 9, 14, 23, 25, 37, 39, 67, 6345, 7324]
array2 = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

#tree1 = build_tree(array1)
tree2 = Tree.new
tree2.build_Tree(array2)
tree2.show
p array2

#puts "\n\n"
#tree2.dfs_rec(9)
#puts "\n\n"
#tree2.depth_first_search(9)
puts "\n\n"
tree2.breadth_first_search(9)
