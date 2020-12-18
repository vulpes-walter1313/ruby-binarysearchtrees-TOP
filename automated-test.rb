require_relative 'Tree.rb'

def pretty_print(node = @root, prefix = '', is_left = true)
  pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
  puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
  pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
end

def print_all_orders(my_tree)
  puts "\nLevel order:"
  my_tree.level_order_iter
  puts "\nPreorder:"
  my_tree.preorder(my_tree.root)
  puts "\nPostorder:"
  my_tree.postorder(my_tree.root)
  puts "\nInorder:"
  my_tree.inorder(my_tree.root)
end

arr = Array.new(15) {rand(200)}
# Create a binary search tree from
# an array of random numbers.
my_tree = Tree.new(arr)
pretty_print(my_tree.root)

# Balance Check
puts "\nIs this tree balanced?"
puts my_tree.balanced?(my_tree.root)

# Print out all elelements in level, pre, post,
# and in order
print_all_orders(my_tree)

# Unbalance tree by inserting new nodes
new_inserts = Array.new(5) {rand(100)}
for val in new_inserts
  my_tree.insert(my_tree.root, val)
end

puts "\nInserted new nodes"
pretty_print(my_tree.root)
puts "\nIs it balanced?"
puts my_tree.balanced?(my_tree.root)

# Rebalance the tree
puts "\nRebalancing"
my_tree.rebalance
puts "\nRebalancing finished"
pretty_print(my_tree.root)

# Confirm it is balanced
puts "\nIs it balanced?"
puts my_tree.balanced?(my_tree.root)

# Print out all elements in level, pre
# post, and inorder
print_all_orders(my_tree)

