require 'debugger'
require 'colorize'

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
      [[-1, -1], [-1, 1]]
    end
  end
  
  def valid_slide_moves
    x, y = pos[0], pos[1]
    potential_moves = slide_moves.map { |pos| [pos[0] + x, pos[1] + y] }
    potential_moves.select { |pos| board.empty?(pos) }
  end
  
  def jump_moves
    # debugger
    x, y = pos[0], pos[1]
    potential_jumps = slide_moves
    
    # return the directional that it can do a jump over
    potential_jumps.select! { |pos| board.has_enemy_piece?(color, [pos[0] + x, pos[1] + y]) }
    potential_jumps.select! { |pos| board.empty?([(pos[0]*2) + x, (pos[1]*2) + y]) }
    potential_jumps
  end
  # 
  # def valid_moves
  #   
  # end
  # 
  
  def to_s
    color == :red ? ("   \u25CE".colorize(:color => :red)) : \
    ("   \u25CE".colorize(:color => :black))
  end
  
end