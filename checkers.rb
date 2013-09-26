class Board
  attr_accessor :state
  
  def initialize
    
  end
  
  def setup
    self.state = Array.new(8) { Array.new(8) }
  end
  
  
  def add_pieces
    
  end
  
  def [](pos)
    x, y = pos
    state[x][y]
  end
  
  def empty?(pos)
    state[pos].nil?
  end
  
  def out_of_bounds?(pos)
    pos.all? { |coord| coord >=0 && coord <= 7 }
  end
  
  def remove_piece(piece)
    self.state[piece.pos.flatten] = nil
  end
  
  
end