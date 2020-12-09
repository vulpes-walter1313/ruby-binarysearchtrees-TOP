require_relative 'Tree.rb'

def pretty_print(node = @root, prefix = '', is_left = true)
  pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
  puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
  pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
end

test = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324, 44, 153, 198, 230, 231])
# test = Tree.new([1, 2, 3, 4, 5, 6, 7])
# test = Tree.new([10, 20, 30, 100, 500])
pretty_print(test.root)

# p test.find(test.root, 23)

puts "\nInserting: 68"
test.insert(test.root, 68)
puts "Inserting: 99"
test.insert(test.root, 99)
puts "Inserting: 45"
test.insert(test.root, 45)
puts "unbalanced"
pretty_print(test.root)
test.rebalance
puts "balanced"
pretty_print(test.root)

# puts "\nDeleting: 8"
# test.delete(test.root, 8)
# pretty_print(test.root)

puts "\nIterative inorder"
test.inorder_iter(test.root)

# puts "\nDeleting: 3"
# test.delete(test.root, 3)
# pretty_print(test.root)

deletenum = 45
puts "deleting #{deletenum}"
test.delete_iter(test.root, deletenum)
test.rebalance
pretty_print(test.root)

deletenum2 = 67
puts "deleting #{deletenum2}"
test.delete_iter(test.root, deletenum2)
test.rebalance
pretty_print(test.root)