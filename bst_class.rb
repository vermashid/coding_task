require_relative "bst_node"

#class to define Binary Search Tree
class BinarySearchTree
	attr_accessor :root_node
  
	# initialization
	def initialize(root_value = nil)
	  @root_node = Node.new(root_value)
	end
			  
	#method to add new nodes in the binary search tree
	def insert node,value
	  if node == nil
		  return Node.new(value)
		else if node.value == nil
			return Node.new(value)
		else if node.value < value
			node.right = insert node.right,value
		else   
			node.left = insert node.left,value
		end
	  end
	  end
	  node
	end
  
	# method to find minimum node in the tree
	def find_min node
	  if node.left.nil?
		  min_node = node
			return min_node
		else
			find_min node.left
		end
	end
  
	# method to find maximum node in the binary search tree
	def find_max node
		if node.right.nil?
		  max_node = node
			return max_node
		else
			find_max node.right
		end
	end
  
	# method for the preorder traversal of the tree
	def preorder node
	  return if node == nil
		print "#{ node.value } "
		preorder node.left
		preorder node.right
	end
  
	#method for the postorder traversal of the tree
	def postorder node
	  return if node == nil
		postorder node.left
		postorder node.right
		print "#{ node.value } "
	end
  
  #method for the inorder traversal of the tree
	def inorder node
	  return if node == nil
		inorder node.left
		print "#{ node.value } "
		inorder node.right
	end
  
  #method to add elemwnts in the output file upon exit
	def modified_inorder node,str
	  if node == nil
		  return str
    end
		str = modified_inorder node.left,str
	  str = str + "," unless str == ""
		str = str + "#{ node.value } "
		str = modified_inorder node.right,str
		str
	end
  
	# method for levelorder traversal of the tree
	def levelorder node
	  result = []
		return result if node.nil? 

		queue = []
		queue << node
          
		until queue.empty?
		  level_size = queue.length
			level = []
			level_size.times do
			  node = queue.shift
			  print "#{ node.value } "
			  queue << node.left unless node.left.nil?
			  queue << node.right unless node.right.nil?
			end
			result << level
	  
	  end 
	end
   
  # method to search an element in the tree
  def search node,value
	  return nil if node.nil? 
		if node.value == value
		  return node
		else if node.value < value
		  search node.right, value
		else
			search node.left, value
		end
	  end
  end
  
  # method to remove inorder predecessor of a node
	def delete_min(root)
	  return root.right if root.left.nil?
		root.left = delete_min(root.left)
		root
	end
  
	# method to find inorder predecessor of a node
	def find_min(root)
	  return root if root.nil? || root.left.nil?
		find_min(root.left)
	end
  
	#method to remove a node from the tree
	def delete_node(root, key)
	  if root == nil
		  print "Element is not present \n"
			return
		end
		cmp = key <=> root.value
		if cmp < 0
		  root.left = delete_node(root.left, key)
		elsif cmp > 0
		  root.right = delete_node(root.right, key)
		else
			return root.left if root.right.nil?
			return root.right if root.left.nil?
			old_root = root
			root = find_min(old_root.right)
			root.right = delete_min(old_root.right)
			root.left = old_root.left
		end
	  root
	end
	
  # method to print all the paths from root to leaf 
	def print_paths node, path
	  return if node.nil?

		if node.left == nil && node.right == nil
		  print(path, " ", node.value, "\n")

		else 
		  self.print_paths(node.left, path + " " + node.value.to_s)
			self.print_paths(node.right, path + " " + node.value.to_s)

		end
	 end
  end
