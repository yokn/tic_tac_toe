# frozen_string_literal: true

require './board.rb'
require './player.rb'

class Game
  @@alive = true
  @current_player = nil
  def initialize
    @board = Board.new
    @player1 = Player.new('X')
    @player2 = Player.new('O')
  end

  def change_players
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def play_game
    while @@alive
      change_players
      puts "#{@current_player.piece}'s turn"
      puts 'Please enter a valid move (1-9)'
      @piece = @current_player.piece
      @board.add_piece(@piece, @ai)
      @board.update_board
      check_game_over
    end
  end

  def start_new_game
    puts 'Do you want play against the Computer? (true/false)'
    @ai = gets.chomp
    @ai = @ai == 'true'
    play_game
  end

  def check_game_over
    @@alive = false if @board.check_win(@current_player.piece) || @board.check_full
    puts @board.win ? "#{@current_player.piece} won!" : "It's a tie!" if @@alive == false
  end
end
