class KnightPathFinder
  DIFFERENTIALS = [[-1,2], [1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2,1]]
  def initialize(pos)
    @pos = pos
  end

  def find_path

  end

  def get_available_moves(pos)
    moves = []
    DIFFERENTIALS.each do |diff|
      potential_move = [diff[0] + pos[0], diff[1] + pos[1]]
      moves << potential_move if valid_move?(potential_move)
    end
    moves
  end

  def valid_move?(pos)
    pos[0].between?(0,7) && pos[1].between?(0,7)
  end

end

if __FILE__ == $PROGRAM_NAME

  kpf = KnightPathFinder.new([0,0])
  p kpf.get_available_moves([4,4])

end
