# frozen_string_literal: true

# Classes:
#   Players:
#     ?AI Player?
#     Piece Type
#   Board:
#     Positions:
#       Empty
#       Taken
#   Game:
#     State:
#       Over
#       In Progress

class Player
  attr_reader :piece

  def initialize(piece)
    @piece = piece
    puts @piece
  end
end

class Board
  def initialize
    @board_array = Array.new(9, 0)
    p @board_array
  end

  # def set_current_player
  #   p Game.player1
  #   @current_player = Game.player1
  #   p @current_player
  # end

  def update_board
    puts @board_array
  end

  def add_piece(slot, piece)
    @board_array[slot - 1] = piece
  end
end

class Game
  @@alive = true
  @@current_player = nil
  attr_accessor :player1
  def initialize
    @board = Board.new
    @player1 = Player.new('X')
    @player2 = Player.new('O')
  end

  def change_players
    @@current_player = if @@current_player == @player1
                         @player2
                       else
                         @player1
                       end
  end

  def start_new_game
    while @@alive
      # p @player1
      change_players
      puts "#{@@current_player}'s turn"
      puts 'Please enter a valid slot'
      slot = gets.chomp.to_i
      piece = @@current_player.piece
      @board.add_piece(slot, piece)
      @board.update_board
      check_game_over
    end
  end

  def check_game_over
    @@alive = false if 0
     end
end

game = Game.new
game.start_new_game
