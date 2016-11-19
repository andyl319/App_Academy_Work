require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
    @children_mark = (@next_mover_mark == :x) ? :o : :x
  end

  def losing_node?(evaluator)
    return @board.winner != evaluator if @board.over?
    self.children.any? do |child|
      !child.losing_node?((evaluator == :x) ? :o : :x)
    end

  end

  def winning_node?(evaluator)
  end


  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    # return [] if
    children_array = []
    3.times do |row|
      3.times do |col|
        next unless @board.empty?([row, col])
        next_board = @board.dup
        next_board[[row,col]] = next_mover_mark
        next_node = TicTacToeNode.new(next_board, @children_mark, [row, col])
        children_array << next_node
      end
    end
    children_array
  end
end

# board = Board.new
# board[[0,1]] = :x
# board[[0,0]] = :o
# root = TicTacToeNode.new(board, :x)
# p root.children.map { |bo| bo.board.rows}
