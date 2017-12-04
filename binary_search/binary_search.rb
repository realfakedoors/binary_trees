# Assignment: build a simple binary tree data structure from some arbitrary input
# and also the “crawler” function that will locate data inside of it.

require_relative 'node'

class Tree
  attr_reader :root
  def initialize
    @root = Node.new
  end
  
  #helper method to add new nodes to our tree, assuming an unsorted array as input.
  def add(element, node = @root)
    if !node.value
      node.value = element
    elsif element < node.value
      add(element, node.left)
    else
      add(element, node.right)
    end
  end
  
  #takes an unsorted array and turns it into a binary tree full of Node objects.
  def build_tree(ary)
    ary.each do |element|
      add element
    end
  end
  
  #takes a target value and returns the node at which it is located, using BFS.
  #uses an array as a queue to keep track of nodes yet to be searched.
  def breadth_first_search(target)
    queue = [@root]
    queue.each do |node|
      return node if node.value == target
      queue << node.left if node.left
      queue << node.right if node.right
    end
    return
  end
  
  #takes a target value and returns the node at which it is located, using DFS.
  #uses an array as a stack to keep track of nodes yet to be searched.
  def depth_first_search(target)
    stack = [@root]
    loop do
      break if stack.empty?
      node = stack.pop
      return node if node.value == target
      stack << node.right if node.right
      stack << node.left if node.left
    end
    return
  end
  
  #runs a depth-first search, but recursively instead of using a stack.
  def dfs_rec(target, node=@root)
    return node if node.value == target
    dfs_rec(target, node.left) if node.left
    dfs_rec(target, node.right) if node.right
  end
end