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

  def find(root, val)
    if root.nil? || root.data == val
      return root
    end

    if root.data < val
      return find(root.right, val)
    end

    return find(root.left, val)
  end

  def insert(root, val)
    if root.nil?
      return Node.new(val)
    else
      if root.data == val
        return root
      elsif root.data < val
        root.right = insert(root.right, val)
      else
        root.left = insert(root.left, val)
      end
      return root
    end
  end

end