require_relative 'node'

Paths = [[1,2],[2,1],[2,-1],[1,-2],[-1,-2],[-2,-1],[-2,1],[-1,2]]

def in_bounds?(coords)
  (1..8).include?(coords.first) && (1..8).include?(coords.last)
end

def possible_moves(position)
  x, y = position
  Paths.map{|a,b| [a+x, b+y]}.select{|move| in_bounds?(move)}
end

def backtrace(node)
  path = []
  loop do
    break if node.nil?
    path << node.coords
    node = node.parent
  end
  path.reverse
end

def knight_moves(start, finish)
  path = backtrace bfs start, finish
  puts "Finished in #{path.count-1} moves!"
  path.each {|move| print "#{move}\n"}
end

def bfs(start, finish)
  queue = [Node.new(start)]
  loop do
    node = queue.shift
    return node if node == finish
    queue += node.set_children(possible_moves(node.coords))
  end
end

knight_moves([1,1],[6,3])