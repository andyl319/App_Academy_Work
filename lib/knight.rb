require 'byebug'
require_relative "00_tree_node"

class KnightPathFinder
  DIFFERENTIALS = [[-1,2], [1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2,1]]
  def initialize(pos)
    @pos = pos
    @visited_positions = [pos]
  end

  def find_path

  end

  def build_move_tree
    root = PolyTreeNode.new(@pos)
    queue = [root]

    until queue.empty?
      current_node = queue.shift
      available_moves = new_move_positions(current_node.value)
      available_moves.each do |move|
        this_child_node = PolyTreeNode.new(move)
        current_node.add_child(this_child_node)
        queue << this_child_node
      end
    end
    root 
  end

  def new_move_positions(pos)
    moves = []
    DIFFERENTIALS.each do |diff|
      potential_move = [diff[0] + pos[0], diff[1] + pos[1]]
      moves << potential_move if valid_move?(potential_move) &&
        !@visited_positions.include?(potential_move)
    end
    @visited_positions += moves
    moves
  end

  def valid_move?(pos)
    pos[0].between?(0,7) && pos[1].between?(0,7)
  end

end

if __FILE__ == $PROGRAM_NAME

  kpf = KnightPathFinder.new([0,0])
  p root = kpf.build_move_tree
  # p a.get_root


end
