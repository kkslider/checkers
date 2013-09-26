require './pieces.rb'
require 'debugger'
require 'colorize'

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
  # 
  # def [](pos)
  #   x, y = pos
  #   @state[x][y]
  # end
  
  # def []=(pos, value)
  #   x, y = pos
  #   @state[x][y] = value
  # end
  
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
    !empty?(pos) && self[pos[0], pos[1]].color != color
  end
  
  def move(pos_from, pos_to)
    
  end
  
  def perform_slide(pos_from, pos_to)
    square = self[pos_from[0], pos_from[1]]
    if !empty?(square.pos) && square.valid_slide_moves.include?(pos_to)
      self[pos_to[0], pos_to[1]] = square
      self.remove_piece(square)
    else
      puts "Invalid slide!"
    end
  end
  
  
  
  def perform_jump(pos_from, pos_to)
    # debugger
    square = self[pos_from[0], pos_from[1]] # square.pos [1, 2]
    x, y = square.pos[0], square.pos[1]
    end_spots = square.jump_moves.map { |pos| [pos[0]*2 + x, pos[1]*2 + y] }
    if end_spots.include?(pos_to)
      self.remove_piece(square)
      
      remove_square_dir = square.jump_moves.select \
        { |dir| [x + (dir[0]*2), y + (dir[1]*2)] == pos_to }
      remove_square = self[remove_square_dir.flatten[0] + x, remove_square_dir.flatten[1] + y]
      self.remove_piece(remove_square)
      self.set_piece(pos_to, square)
    end
  end
  
  def set_piece(pos, piece)
    x, y = pos
    piece.pos = pos
    self[x, y] = piece
  end
  
  def remove_piece(piece)
    x, y = piece.pos
    # piece = nil
    self[x, y] = nil
  end
  
  def to_s
    puts
    # every_other = true
    puts "    0   1   2   3   4   5   6   7  "
    self.state.each_with_index do |row, r_index|
      print "#{r_index}"
      row.each_with_index do |col, c_index|
        square = self[r_index, c_index]
        if square
          if (c_index.odd? && r_index.odd?) || (c_index.even? && r_index.even?)
            print "#{square}"#.colorize( :background => :light_cyan)
          else
            print "#{square}"#.colorize( :background => :light_white)
          end
        else
          if (c_index.odd? && r_index.odd?) || (c_index.even? && r_index.even?)
            print "   -"#.colorize( :background => :light_cyan )
          else
            print "   -"#.colorize( :background => :light_white )
          end
        end
      end
      puts
    end
  end
  nil
end

board = Board.new

