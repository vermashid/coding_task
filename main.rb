require_relative "ll_class"
require_relative "bst_class"

# main funtion for the app
def main()

	#welcome menu
  print " Welcome to Data Structures \n"
  print " Press 1 for BinarySearchTree \n"
  print " Press 2 for LinkedList \n"
  print " Press 0 to exit \n"
  input = gets.chomp.to_i
  
	#initialization of the bst and linkedlist objects
  tree = BinarySearchTree.new()
	linked_list = LinkedList.new()
  input1 = 10

  while input1

	  # Option to operate on the binary search tree
    if input == 1
      print "\n Welcome to BinarySearchTree \n"
      print " Press 1 to add elements to the Tree \n"
      print " Press 2 to print the largest element in the BST \n"
      print " Press 3 to print the smallest element in the BST \n"
      print " Press 4 to print inorder, preorder, postorder, levelorder traversals \n"
      print " Press 5 to search an element \n"
      print " Press 6 to remove an element \n"
      print " Press 7 to print all the paths i.e starting from root to the leaf \n"
      print " Press 0 to exit \n"
      input1 = gets.chomp.to_i
  
      # options for taking input
      case input1
      when 1
        print "Choose an option\n"
        print "1- Enter the elements of the tree (seperated by comma) \n"
        print "2- Read from file \n"

        r=gets.chomp.to_i
        case r
        when 1
          elements = gets.chomp
        when 2
			 
          #Reading from the file
			    File.open("input.txt", "r") do |f|
          elements = f.read()
        end
      end

      elements1 = elements.split(",")
      elements1.each{|n| tree.root_node = tree.insert(tree.root_node,n.to_i)}
      print "Tree is successfully generated \n "

     when 2
       max = tree.find_max(tree.root_node)
       print "Largest element is #{ max.value } \n"
     when 3
       min = tree.find_min(tree.root_node)
       print "Smallest element is #{ min.value } \n"
     when 4

		   #different traversals of the tree
       print " Press 1 to print inorder traversal \n"
       print " Press 2 to print preorder traversal \n"
       print " Press 3 to print postorder traversal \n"
       print " Press 4 to print levelorder traversal \n"
       t = gets.chomp.to_i
       case t
         when 1
           tree.inorder(tree.root_node)
           print "\n"
         when 2
           tree.preorder(tree.root_node)
           print "\n"
         when 3
           tree.postorder(tree.root_node)
           print "\n"
         when 4
           tree.levelorder(tree.root_node)
           print "\n"
       end
	   when 5
       print "Enter element to be searched \n"
       s = gets.chomp.to_i
       if tree.search(tree.root_node,s) == nil
         print " Element is not present \n"
       else
         print " Element is present \n"
       end
     when 6
       print "Enter element to be removed \n"
       del = gets.chomp.to_i
       tree.delete_node(tree.root_node,del)
     when 7
       tree.print_paths(tree.root_node," ")
     else
       text = ""
       text = tree.modified_inorder(tree.root_node,text)
       puts text
       File.write("output.txt", text)
     exit(0)

     end

    else if input == 2

		  #option to operate on linkedlist
      print "\n Welcome to LinkedList \n"
      print " Press 1 to add elements to the List \n"
      print " Press 2 to serach in linkedlist \n"
      print " Press 3 to delete an element from list \n"
      print " Press 4 to print the linked list\n"
      print " Press 5 to reverse a linked list \n"
      print " Press 0 to exit \n"
      input1 = gets.chomp.to_i

      case input1
      when 1

		    #option to take input for the list
        print "Choose an option\n"
        print "1- Enter the elements of the list (seperated by comma) \n"
        print "2- Read from file \n"

        r=gets.chomp.to_i
      case r
        when 1
          elements = gets.chomp
        when 2
			    #reading from the file
          File.open("input.txt", "r") do |f|
          elements = f.read()
        end
      end

      elements1 = elements.split(",")
      elements1.each{|n| tree.root_node = linked_list.addition(n.to_i)}
      print "list is successfully generated \n "

      when 2
        print "Enter element to be searched \n"
        s = gets.chomp.to_i
        if linked_list.find(s) == nil
          print " Element is not present \n"
        else
          print " Element is present \n"
        end

      when 3
        print "Enter element to be removed \n"
        del = gets.chomp.to_i
        linked_list.deletion(del)

	    when 4
        linked_list.print_list()

	    when 5
		    linked_list.reverse()
		    print "List is successfully reversed \n"

	    else
        text = ""
        text = linked_list.modified_print(text)
        puts text
        File.write("output.txt", text)
        exit(0)

	    end
 	  end
  end
 end
end
main()
