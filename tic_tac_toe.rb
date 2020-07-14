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
    # puts @piece
  end
end

class Board
  def initialize
    @board_array = Array.new(9, 0)
    # p @board_array
    @result = []
    @wins_array = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
  end

  def update_board
    p @board_array
  end

  def add_piece(slot, piece)
    @board_array[slot - 1] = piece
  end

  def check_full
    !@board_array.include?(0)
  end

  def check_win
    win = false
    @wins_array.each do |possible_win|
      possible_win.each_with_index do |slot, index|
        @result[index] = 'X' if @board_array[slot - 1] == 'X'
        p 'hello'
      end
      p @result
      win = true if @result.count('X') == 3
    end
    win
  end
end

class Game
  @@alive = true
  @@current_player = nil
  # attr_accessor :player1
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
      puts "#{@@current_player.piece}'s turn"
      puts 'Please enter a valid slot'
      slot = gets.chomp.to_i
      piece = @@current_player.piece
      @board.add_piece(slot, piece)
      @board.update_board
      check_game_over
    end
  end

  def check_game_over
    @@alive = false if @board.check_win || @board.check_full
  end
end

game = Game.new
game.start_new_game
