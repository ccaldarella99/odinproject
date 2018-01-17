class Node
	attr_accessor :value, :nextAddress
	
	def initialize(value=nil, next_node=nil)
		@value = value
		@nextAddress = next_node
	end
end

class LinkedList
	attr_accessor :head
	
	def initialize(value)
		@head = Node.new(value, nil)
	end
	
	def append(value=nil)
		current = @head
		while current.nextAddress != nil
			current = current.nextAddress
		end
		current.nextAddress = Node.new(value, nil)
	end
	
	def prepend(value=nil)
		@head = Node.new(value, @head)
	end
	
	def size
		count = 0
		current = @head
		while current.nextAddress != nil
			current = current.nextAddress
			count += 1
		end
		count += 1
	end
	
	def head
		@head.value
	end
	
	def tail
		current = @head
		while current.nextAddress != nil
			current = current.nextAddress
		end
		current.value
	end
	
	def at(index)
		return "ERROR: Outside List bounds" if(index > self.size - 1)
		return "ERROR: Outside List bounds" if(index < 0)
		count = 0
		current = @head
		until count == index
			current = current.nextAddress
			count += 1
		end
		current.value
	end
	
	def pop
		prev = @head
		current = prev.nextAddress
		while current.nextAddress != nil
			prev = current
			current = current.nextAddress
		end
		prev.nextAddress = nil
	end
	
	def contains?(data)
    return true if(@head.value == data)
		current = @head
		while current.nextAddress != nil
			current = current.nextAddress
      return true if(current.value == data)
		end
    return false
	end
	
	def find(data)
    _ret = nil
    count = 0
		current = @head
    _ret = count if(current.value == data)
		while current.nextAddress != nil
			current = current.nextAddress
      count += 1
      _ret = count if(current.value == data)
		end
    return _ret
	end
	
	def to_s
		current = @head
		while current.nextAddress != nil
			puts "#{current.value}"
			current = current.nextAddress
		end
		puts "#{current.value}"
	end
	
	#EXTRA CREDIT
	def insert_at(new_value, index)
		if(index == 0)
			self.prepend(new_value)
		elsif(index == self.size - 1)
			self.append(new_value)
		else
			current = @head
			count = 1
			until count == index
				current = current.nextAddress
				count += 1
			end
			newNode = Node.new(new_value, current.nextAddress)
			current.nextAddress = newNode
		end
	end
	
	def remove_at(index)
	end
end


a = LinkedList.new("abc <- FIRST (1)")
puts "1.)"
a.to_s
a.append("def - 2")
a.append("def - 3")
a.append("def <- LAST (4)")
puts "\n2.)"
a.to_s
a.prepend("xyz <- NEW FIRST (0)")
puts "\n3.)"
a.to_s
puts "\nSize = #{a.size}"
puts "Tail: #{a.tail}"
puts "Head: #{a.head}"
puts "Index 0: #{a.at(0)}"
puts "Index 1: #{a.at(1)}"
puts "Index 2: #{a.at(2)}"
puts "Index 4: #{a.at(4)}"
puts "Index 6: #{a.at(5)}"

puts "\n4.)"
a.pop
a.to_s
puts a.contains?("def - 3")
puts a.contains?("qrs")
puts a.contains?("abc <- FIRST (1)")

puts ""

puts a.find("xyz <- NEW FIRST (0)")
puts a.find("abc <- NEW FIRST")
puts a.find("def - 3")

puts " The List is now size: #{a.size}"
puts a.to_s

a.insert_at("new at 0", 0)
puts a.to_s
a.insert_at("new at 1", 1)
puts a.to_s
a.insert_at("new at #{a.size}", a.size-1)
puts a.to_s




