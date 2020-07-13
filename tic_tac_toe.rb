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
    # @current_player=
  end

  def add_piece(slot, piece)
    @board_array[slot] = piece
  end
end

class Game
  attr_accessor :player1
  def initialize
    @board = Board.new
    @player1 = Player.new('X')
    @player2 = Player.new('O')
  end

  def start_new_game
    p @player1
    # @board.set_current_player
    puts "X's Turn"
    puts 'Please enter a valid move'
    slot = gets.chomp.to_i
    piece = player1.piece
    @board.add_piece(slot, piece)
  end

  def check_game_over; end
end

game = Game.new
game.start_new_game
