# frozen_string_literal: true

# TO DO:

# Input validation
# Add option to play against the Computer
# Allow player to choose piece

class Player
  attr_reader :piece

  def initialize(piece)
    @piece = piece
    # puts @piece
  end
end

class Board
  attr_reader :win
  def initialize
    @board_array = Array.new(9, '-')
    @wins_array = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
  end

  def update_board
    puts <<-HEREDOC
    #{@board_array[0]} #{@board_array[1]} #{@board_array[2]}
    #{@board_array[3]} #{@board_array[4]} #{@board_array[5]}
    #{@board_array[6]} #{@board_array[7]} #{@board_array[8]} 
    HEREDOC
  end

  def add_piece(slot, piece)
    @board_array[slot - 1] = piece
  end

  def check_full
    !@board_array.include?('-')
  end

  def check_win(piece)
    @win = false
    @wins_array.each do |possible_win|
      @result = []
      possible_win.each_with_index do |slot, index|
        @result[index] = piece if @board_array[slot - 1] == piece
      end
      puts "testing if #{possible_win} is a win: #{@result}"
      @win = true if @result.count(piece) == 3
    end
    @win
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
    @@alive = false if @board.check_win(@@current_player.piece) || @board.check_full
    puts @board.win ? "#{@@current_player.piece} won" : "It's a tie!" if @@alive == false
  end
end

game = Game.new
game.start_new_game
