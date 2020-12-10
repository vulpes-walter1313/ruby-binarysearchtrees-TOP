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

  def rebalance
    arr = self.inorder_iter(@root, rtflag=true)
    @root = build_tree(arr)
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

  def next_min_value_node(node)
    current = node.right
    while current.left != nil
      current = current.left
    end
    return current

  end

  def delete(root, val)
    # NOT WORKING
    # Base Case
    if root.nil?
      return root
    end
    # if val is less than root
    if val < root.data
      root.left = delete(root.left, val)
    # If val is greater than root
    elsif val > root.data
      root.right = delete(root.right, val)
    # If val is == to root
    else
      # If node only has 1 or no leafs
      if root.left.nil?
        temp = root.right
        root = nil
        return temp
      elsif root.right.nil?
        temp = root.left
        root = nil
        return temp
      end

      # Node with two leafs
      temp = next_min_value_node(root.right)

      root.data = temp.data
      root.right = delete(root.right, temp.data)
      return root
    end 
  end

  def inorder_iter(root, rtflag=false)
    # rtflag is a flag to return an arr
    # of the values, if false then it
    # will just output to the console.
    return if root.nil?
    stack = []
    alldata = []
    while true
      if root != nil
        stack.push(root)
        root = root.left
      else
        break if stack.empty?
        root = stack.pop
        if rtflag == true
          alldata.push(root.data)
        end
        puts root.data if rtflag == false
        root = root.right
      end
    end
    if rtflag
      return alldata
    end
  end

  def parent_deleteNode(toDeleteVal)
    parent = @root
    
    temp = nil
    while true
      if parent.nil?
        # puts "root is nil"
        return nil
      elsif parent.data == toDeleteVal
        # puts "Found a match #{toDeleteVal}"
        return {parent: parent}
      elsif parent.left.data == toDeleteVal
        # puts "#{parent.data} left child is #{toDeleteVal}"
        temp = parent.left
        break
      elsif parent.right.data == toDeleteVal
        # puts "#{parent.data} right child is #{toDeleteVal}"
        temp = parent.right
        break
      elsif toDeleteVal < parent.data && parent.left != nil
        # puts "#{toDeleteVal} is less than #{parent.data} AND has #{parent.left.data} to it's left"
        parent = parent.left
      elsif toDeleteVal > parent.data && parent.right != nil
        # puts "#{toDeleteVal} is greater than #{parent.data} AND has #{parent.left.data} to it's right"
        parent = parent.right
      elsif parent.left.nil? && parent.right.nil?
        # puts "neither #{parent.data} has a left or right"
        return nil
      end
    end
    
    return {parent: parent, temp: temp}
  end

  def delete_iter(root, val)
    return if root.nil?
    
    if root.data == val
      replace_node = self.next_min_value_node(root)
      new_data = replace_node.data
      self.delete_iter(@root, replace_node.data)
      root.data = new_data
    else
      res = self.parent_deleteNode(val)
      parent_node = res[:parent]
      to_delete_node = res[:temp]
      # Nochildren condition
      if to_delete_node.left.nil? && to_delete_node.right.nil?
        if parent_node.left == to_delete_node
          parent_node.left = nil
        else
          parent_node.right = nil
        end
        # Left Child only
      elsif to_delete_node.left != nil && to_delete_node.right == nil
        if parent_node.left == to_delete_node
          parent_node.left = to_delete_node.left
        else
          parent_node.right = to_delete_node.left
        end
        # Right Child only
      elsif to_delete_node.right != nil && to_delete_node.left == nil
        if parent_node.left == to_delete_node
          parent_node.left = to_delete_node.right
        else
          parent_node.right = to_delete_node.right
        end
        # Two children
      else
        replace_node = self.next_min_value_node(to_delete_node)
        new_data = replace_node.data
        self.delete_iter(@root, replace_node.data)
        to_delete_node.data = new_data
      end
    end
  end

  def level_order_iter
    queue = []
    current = @root
    queue.push(current)
    while queue.empty? == false
      current = queue.shift
      puts current.data
      queue.push(current.left) if current.left != nil
      queue.push(current.right) if current.right != nil
    end
  end

  def preorder_iter(root)
    return if root.nil?
    stack = []
    stack.push(root)
    while stack.empty? == false
      current = stack.pop
      puts current.data
      stack.push(current.right) if current.right != nil
      stack.push(current.left) if current.left != nil
    end
  end
  
end