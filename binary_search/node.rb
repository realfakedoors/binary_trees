#We build a class for our node objects. Each node contains a value and links to its parent and children.

class Node
  attr_accessor :value, :parent, :left, :right
  def initialize(value = nil, parent = nil)
    @value = value
    @parent = parent
  end
  
  def to_s
    value.to_s
  end
  
  def left
    @left || @left = Node.new(nil, self)
  end
  
  def right
    @right || @right = Node.new(nil, self)
  end
  
  def empty?
    !value
  end
end