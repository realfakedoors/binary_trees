class Node
  attr_accessor :coords, :children, :parent

  def initialize(coords, parent = nil)
    @coords = coords
    @parent = parent
    @children = []
  end

  def set_children(coords)
    @children = coords.map{|val| Node.new(val,self)}
  end
  
  def ==(coords)
    @coords == coords
  end
end