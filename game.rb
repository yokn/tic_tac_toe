# frozen_string_literal: true

require './board.rb'
require './player.rb'

class Game
  @@alive = true
  @current_player = nil
  # attr_accessor :player1
  def initialize
    @board = Board.new
    @player1 = Player.new('X')
    @player2 = Player.new('O')
  end

  def change_players
    @current_player = if @current_player == @player1
                        @player2
                      else
                        @player1
                      end
  end

  def start_new_game
    while @@alive
      change_players
      puts "#{@current_player.piece}'s turn"
      puts 'Please enter a valid slot'
      piece = @current_player.piece
      @board.add_piece(piece)
      @board.update_board
      check_game_over
    end
  end

  def check_game_over
    @@alive = false if @board.check_win(@current_player.piece) || @board.check_full
    puts @board.win ? "#{@current_player.piece} won" : "It's a tie!" if @@alive == false
  end
end
