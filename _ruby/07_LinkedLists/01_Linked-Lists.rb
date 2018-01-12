class LinkedList
	attr_accessor :listItem
	
	class Node
		attr_accessor :value, :address, :nextAddress, :isHead, :isTail
		
		def initialize(value)
			@value = value
			@nextAddress = nil#||= nextAddress
			@address = self.object_id << 1
			@isHead = false
			@isTail = false
		end
	end
	
	def initialize(value=nil)
		@listItem = Node.new(value)
		@listItem.isHead = true
		@listItem.isTail = true
	end
	
	def append(value=nil)
		prevNode = @listItem.node
		@listItem.isTail = false

		@listItem = Node.new(value)
		@listItem.isHead = false
		@listItem.isTail = true
		prevNode.nextAddress = @listItem.address
	end
	
	def prepend
	end
	
	def size
		return 0
	end
	
	def head
	end
	
	def tail
	end
	
	def at(index)
	end
	
	def pop
	end
	
	def contains?
	end
	
	def find(data)
	end
	
	def to_s
		p self
	end
	
	def insert_at(index)
	end
	
	def remove_at(index)
	end
end


a = LinkedList.new("xyz")
#a.append = "abc"
a.to_s
