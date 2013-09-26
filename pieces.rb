class Piece
  attr_reader :board, :color
  attr_accessor :pos, :king
  
  def initialize(board, color, pos)
    @board = board
    @color = color
    @pos = pos
    @king = false
  end
  
  def valid_moves
    
  end
  
  
end