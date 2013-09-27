require './checkers.rb'

class HumanPlayer
  attr_reader :color
  
  def initialize(color)
    @color = color
  end
end

class Checkers
  attr_accessor :board, :current_player
  
  def initialize
    @board = Board.new
    @players = { 
                 :player_1 => HumanPlayer.new(:black), 
                 :player_2 => HumanPlayer.new(:red) 
               }
    @current_player = :player_1
  end
  
  def user_interaction
    
    puts "#{self.current_player.to_s} enter the position of the piece you'd like to move."
    input_from = gets.chomp.split.map(&:to_i)
    puts "#{self.current_player.to_s} enter the position you'd like to move to."
    input_to = gets.chomp.split.map(&:to_i)
    
    if board[input_from[0], input_from[1]].color != @players[self.current_player].color
      puts "WRONG COLOR PIECE"
    end
    
    self.board.move(input_from, input_to)
    
    self.current_player == :player_1 ? \
      self.current_player = :player_2 : self.current_player = :player_1
    
    print self.board
  end
  
  def play
    game_over = false
    
    until game_over
      user_interaction
    end
  end
  
  
end

# checkers = Checkers.new
# print checkers.board