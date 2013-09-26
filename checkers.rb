require './pieces.rb'
require 'debugger'

class Board
  attr_accessor :state
  
  def initialize
    @state = Array.new(8) { Array.new(8) }
    add_pieces
  end
  
  def add_pieces
    add_red_pieces
    add_black_pieces
  end
  
  def [](x, y)
    @state[x][y]
  end
  
  def []=(x, y, value)
    @state[x][y] = value
  end
  
  def add_red_pieces
    # debugger
    self[0, 0] = Piece.new(self, :red, [0, 0])
    self[0, 2] = Piece.new(self, :red, [0, 2])
    self[0, 4] = Piece.new(self, :red, [0, 4])
    self[0, 6] = Piece.new(self, :red, [0, 6])
    
    self[1, 1] = Piece.new(self, :red, [1, 1])
    self[1, 3] = Piece.new(self, :red, [1, 3])
    self[1, 5] = Piece.new(self, :red, [1, 5])
    self[1, 7] = Piece.new(self, :red, [1, 7])
    
    self[2, 0] = Piece.new(self, :red, [2, 0])
    self[2, 2] = Piece.new(self, :red, [2, 2])
    self[2, 4] = Piece.new(self, :red, [2, 4])
    self[2, 6] = Piece.new(self, :red, [2, 6])
  end
  
  def add_black_pieces
    self[5, 1] = Piece.new(self, :black, [5, 1])
    self[5, 3] = Piece.new(self, :black, [5, 3])
    self[5, 5] = Piece.new(self, :black, [5, 5])
    self[5, 7] = Piece.new(self, :black, [5, 7])
  
    self[6, 0] = Piece.new(self, :black, [6, 0])
    self[6, 2] = Piece.new(self, :black, [6, 2])
    self[6, 4] = Piece.new(self, :black, [6, 4])
    self[6, 6] = Piece.new(self, :black, [6, 6])
    
    self[7, 1] = Piece.new(self, :black, [7, 1])
    self[7, 3] = Piece.new(self, :black, [7, 3])
    self[7, 5] = Piece.new(self, :black, [7, 5])
    self[7, 7] = Piece.new(self, :black, [7, 7])
  end
  
  def empty?(pos)
    self[pos[0], pos[1]].nil? && !out_of_bounds?(pos)
  end
  
  def out_of_bounds?(pos)
    pos.any? { |coord| coord < 0 || coord > 7 }
  end
  
  def has_enemy_piece?(color, pos)
    empty?(pos) && state.color != color
  end
  
  def remove_piece(piece)
    self.state[piece.pos.flatten] = nil
  end
  
  def to_s
    puts "   0    1    2    3    4    5    6    7   "
    self.state.each_with_index do |row, r_index|
      print "#{r_index}"
      row.each_with_index do |col, c_index|
        square = self[r_index, c_index]
        if square
          square.color == :red ? (print "  R  ") : (print "  B  ")
        else
          print "  -  "
        end
      end
      puts
    end
  end
end

board = Board.new
