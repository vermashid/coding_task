require_relative "ll_node"

# class for the linked list
class LinkedList

	#initialization of the linkedlist object
  def initialize(value = nil)
    @head = LLNode.new(value, nil)
  end
  
	#method to add elements in the list
  def addition(value)
		if @head.value == nil
			@head = LLNode.new(value,nil)
		else
    current_node = @head
    while current_node.next_node != nil
      current_node = current_node.next_node
    end
      current_node.next_node = LLNode.new(value, nil)
		end
  end
  
	#method to search an element in the list
  def find(value)
    current_node = @head
    puts current_node.value
    return false unless current_node.next_node
    return current_node if current_node.value == value
    while (current_node = current_node.next_node)
      return current_node if current_node.value == value
    end
  end
  
	# method to delete an element from the list
  def deletion(value)
    current_node = @head
    if current_node.value == value
      @head = current_node.next_node
    else
      while (current_node.next_node != nil) && (current_node.next_node.value != value)
        if (current_node.next_node == nil) || (current_node.next_node.value == value)
          current_node.next_node = current_node.next_node.next_node
        else
          current_node = current_node.next_node
        end
      end
      current_node.next_node = current_node.next_node.next_node
    end
  end
  
	#method to print the linked list
  def print_list
    current_node = @head
    puts current_node.value
    while (current_node = current_node.next_node)
      puts current_node.value
    end
  end
  
	# modified funtion to write the elements of linked list in output file upon exit
	def modified_print str
		current_node = @head
		str = str + "#{ current_node.value } "
		while (current_node = current_node.next_node)
			str = str + "," unless str == ""
      str += "#{ current_node.value } "
    end
		str
	end	
  
	#method to reverse a linked list
  def reverse
    previous = nil
    current = @head

    while current != nil
      next_node = current.next_node
      current.next_node = previous
      previous = current
      current = next_node
    end

    @head = previous
  end

end
