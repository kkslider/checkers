class Piece
  attr_reader :board, :color
  attr_accessor :pos, :king
  
  def initialize(board, color, pos)
    @board = board
    @color = color
    @pos = pos
    @king = false
  end
  
  def opp_color
    color == :red ? :black : :red
  end
  
  def slide_moves
    if king
      return [[1, -1], [1, 1], [-1, -1], [-1, 1]]
    end
    
    if color == :red
      [[1, -1], [1, 1]]
    else
      [[-1. -1], [-1, 1]]
    end
  end
  
  def valid_slide_moves
    slide_moves.select { |pos| board.empty?(pos) }
  end
  
  def jump_moves
    potential_jumps = slide_moves
    potential_jumps.select! { |pos| board.has_enemy_piece?(color, pos) }
    potential_jumps.map! { |pos| [pos[0] * 2, pos[1] * 2] }
    potential_jumps.select { |pos| board.empty?(pos) }
  end
  
  def valid_moves
    
  end
  
  
end