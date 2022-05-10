class GraphNode
  attr_reader :value, :neighbors
  def initialize(value)
    @value = value
    self.neighbors = []
  end

  def bfs(starting_node, target_value)
    return starting_node if starting_node.value == target_value
    return nil if starting_node == nil
    
  end
end