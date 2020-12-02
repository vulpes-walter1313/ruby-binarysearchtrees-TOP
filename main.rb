require_relative 'Tree.rb'

def pretty_print(node = @root, prefix = '', is_left = true)
  pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
  puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
  pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
end

test = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
# test = Tree.new([1, 2, 3, 4, 5, 6, 7])
# test = Tree.new([10, 20, 30, 100, 500])
pretty_print(test.root)
# p test.find(test.root, 23)
puts "\nInserting: 44"
test.insert(test.root, 68)
test.insert(test.root, 99)
test.insert(test.root, 45)
pretty_print(test.root)
