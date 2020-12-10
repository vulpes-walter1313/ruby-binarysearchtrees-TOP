# ruby-binarysearchtrees-TOP
My work in Binary Search Trees Project from The Odin Project.

# Tree M ethods

## initialize
The initialize method for three is very simple. It takes in an array of values that will be sorted and made uniq then it will call the method `build_tree` to create a balanced binary tree and return the top-level root node.

```Ruby
def initialize(arr)
  @root = self.build_tree(arr)
end
```

## build_tree(arr)
The `build_tree` method creates a balanced binary search tree from an array of values using recursion. This method is first called during initialization of a tree object and during the `rebalance` method.

```Ruby
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
```

## rebalance
The method `rebalance` is a very simple method that calls `inorder_iter` which returns an array of all the values stores in the binary tree. with that new array, it passes the array to `build_tree` which return a balanced binary tree and assigns it to `@root`.

```Ruby
def rebalance
  arr = self.inorder_iter(@root, rtflag=true)
  @root = build_tree(arr)
end
```

## find(root, val)
The find method is a recursive method that returns the node whose `root.data == val`. If `val` is not in the tree then it returns `nil`.

## insert(root, val)
The insert method is a recursive method that inserts a value if it's not found in the tree already(returns the existing node if it's already in the tree). The inserting of values is done without rebalancing the tree which can cause an unbalanced tree structure. To rebalance simply call the method `rebalance` after insertions.

## next_min_value_node(node)
This method is a helper method that returns the next minimum value in the right subtree of `node`. This method is iterative.

## delete(root, val)
This method is not finished. This is an attempt to delete nodes recursively. It has a strange behaviour of deleting a whole host of nodes I do not intend to delete. Will keep trying to find my mistake.

## inorder_iter(root, rtflag=false)
This method has adjustable functionality. In it's default mode, ignoring rtflag, it simply prints all the values in the tree from the `root` start point to the console. However if `rtflag=true`, it modifies it's behaviour to return an array of the values found in the tree starting from `root`. This `rtflag=true` functionality comes in handy inside the `rebalance` method.

## parent_deleteNode(toDeleteVal)
This method return one of the following:
1. nil
2. Hash with `:parent`
3. Hash with `:parent, :temp`

Here, `:temp` is the value that is to be deleted while `:parent` is the parent of the node to be deleted. If it only contains `:parent` then the node to be deleted is top level root and therefore has no parents of it's own. If the method is called on an empty tree then nil is returned.

## delete_iter(root, val)
This method is the currently only delete method that works. It's still recursive in a way. It uses the help of the `self.parent_deleteNode(val)` to iterate through the nodes to find the node to be deleted and it's parent node(if applicable). only in the case that the node to be deleted has two children, instead of deleting the node, it replaces the `node.data` value with the value of the node returned by `self.next_min_value_node(node)` and deletes that `next_min_value_node` by calling `self.delete_iter(@root, replace_node.data)`.

```Ruby
# ---snipped---
else
  replace_node = self.next_min_value_node(to_delete_node)
  new_data = replace_node.data
  self.delete_iter(@root, replace_node.data)
  to_delete_node.data = new_data
end
```

## level_order_iter
This method prints out the breadth-first level-order traversal of the tree starting from the `@root`. It is an iterative method that utilizes a stack

## preorder_iter(root)
This method prints out the pre-order travesal from root. Preorder is `print-left-right`.