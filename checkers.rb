require './pieces.rb'
require 'debugger'

class Board
  attr_accessor :state
  
  def initialize
    @state = Array.new(8) { Array.new(8) }
    # p state
    # p state[1]
    add_pieces
  end
  
  # def setup
#     add_pieces
#   end
#   
  
  def add_pieces
    add_red_pieces
    # p self.state[0]
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

    
    
    
    
    # debugger
    # (0..2).each do |r_index|
    #   if r_index % 2 == 0
    #     self.state[r_index].each_with_index do |c1, c_index|
    #       pos = [r_index, c_index]
    #       if c_index % 2 == 0
    #         self.state[r_index, c_index] = Piece.new(self, :red, pos)
    #       end
    #     end
    #   else
    #     self.state[r_index].each_with_index do |c1, c_index|
    #       pos = [r_index, c_index]
    #       if c_index % 2 != 0
    #         self.state[r_index, c_index] = Piece.new(self, :red, pos)
    #       end
    #     end
    #   end
    # end
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
    
    
    
    # (5..7).each do |r_index|
    #   # self.state[row_index]
    #   if r_index % 2 == 0
    #     self.state[r_index].each_with_index do |column, c_index|
    #       pos = [r_index, c_index]
    #       if c_index % 2 == 0
    #         self.state[r_index, c_index] = Piece.new(self, :red, pos)
    #       end
    #     end
    #   else
    #     self.state[r_index].each_with_index do |column, c_index|
    #       pos = [r_index, c_index]
    #       if c_index % 2 != 0
    #         self.state[r_index, c_index] = Piece.new(self, :red, pos)
    #       end
    #     end
    #   end
    # end
  end
  
  
  
  
  
  
  
  
  
  
  
  
  
  def empty?(pos)
    self[pos].nil?
  end
  
  def out_of_bounds?(pos)
    pos.all? { |coord| coord >=0 && coord <= 7 }
  end
  
  def has_enemy_piece?(color, pos)
    empty?(pos) && state.color != color
  end
  
  def remove_piece(piece)
    self.state[piece.pos.flatten] = nil
  end
  
  def to_s
    # debugger
    # p self.state
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
# p board
