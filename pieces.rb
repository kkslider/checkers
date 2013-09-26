class Piece
  attr_reader :board, :color
  attr_accessor :pos, :king
  
  def initialize(board, color, pos)
    @board = board
    @color = color
    @pos = pos
    @king = false
  end
  
  def directionals(color)
    if king
      return [[1, -1], [1, 1], [-1, -1], [-1, 1]]
    end
    
    if color == :red
      [[1, -1], [1, 1]]
    else
      [[-1. -1], [-1, 1]]
    end
  end
  
  def opp_color
    color == :red ? :black : :red
  end
  
  def slide_moves
    
  end
  
  def jump_moves
    
  end
  
  def valid_moves
    
  end
  
  
end