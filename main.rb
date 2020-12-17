require_relative 'Tree.rb'

def pretty_print(node = @root, prefix = '', is_left = true)
  pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
  puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
  pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
end

mytree = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324, 44, 153, 198, 230, 231])
# mytree = Tree.new([1, 2, 3, 4, 5, 6, 7])
# mytree = Tree.new([10, 20, 30, 100, 500])
pretty_print(mytree.root)

# p mytree.find(mytree.root, 23)

puts "\nInserting: 2"
mytree.insert(mytree.root, 2)
# puts "Inserting: 99"
# mytree.insert(mytree.root, 99)
# puts "Inserting: 101"
# mytree.insert(mytree.root, 101)
# puts "Inserting: 45"
# mytree.insert(mytree.root, 45)
# puts "unbalanced"
# pretty_print(mytree.root)
# mytree.rebalance
# puts "balanced"
# pretty_print(mytree.root)

# puts "\nDeleting: 8"
# mytree.delete(mytree.root, 8)
# pretty_print(mytree.root)


# puts "\nDeleting: 3"
# mytree.delete(mytree.root, 3)
# pretty_print(mytree.root)

# deletenum = 45
# puts "deleting #{deletenum}"
# mytree.delete_iter(mytree.root, deletenum)
# mytree.rebalance
# pretty_print(mytree.root)

# deletenum2 = 67
# puts "deleting #{deletenum2}"
# mytree.delete_iter(mytree.root, deletenum2)
# mytree.rebalance
# pretty_print(mytree.root)

# puts "\nIterative inorder"
# mytree.inorder_iter(mytree.root)

# puts "\nRecursive inorder"
# mytree.inorder(mytree.root)

# puts "\nLevel order:"
# mytree.level_order_iter

# puts "\npre-order Iterative:"
# mytree.preorder_iter(mytree.root)

# puts "\nRecursive preorder"
# mytree.preorder(mytree.root)

# puts "\npost-order:"
# mytree.postorder_iter(mytree.root)

# puts "\nRecursive postorder"
# mytree.postorder(mytree.root)

puts "\nHeight of root:"
puts mytree.height(mytree.root)

puts("\nCurrent tree:")
pretty_print(mytree.root)

puts("\nis it balanced(should be false):")
puts mytree.balanced?(mytree.root)

mytree.rebalance
puts("\nCurrent tree after rebalance():")
pretty_print(mytree.root)

puts("\nis it balanced(should be true):")
puts mytree.balanced?(mytree.root)

depth_node_num = 6345
puts "What is the depth of #{depth_node_num}"
puts mytree.depth(mytree.find(mytree.root, depth_node_num))
