require_relative 'Node.rb'
class Tree
  attr_reader :root
  def initialize(arr)
      @root = self.build_tree(arr)
  end

  def build_tree(arr)
    working_arr = arr.sort.uniq

    # Base case
    if working_arr.empty?
      return nil
    end

    middle = (working_arr.length)/2

    root = Node.new(working_arr[middle])

    root.left = build_tree(working_arr[0...middle])
    root.right = build_tree(working_arr[middle + 1 ..-1])

    return root
  end
end