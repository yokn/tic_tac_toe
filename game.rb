# frozen_string_literal: true

require './board.rb'
require './player.rb'

class Game
  attr_accessor :board
  def initialize
    @board = Board.new
    @player1 = Player.new('X')
    @player2 = Player.new('O')
    @alive = true
    @current_player = nil
  end

  def change_players
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def play_game
    while @alive
      change_players
      puts "#{@current_player.piece}'s turn"
      puts 'Please enter a valid move (1-9)'
      @piece = @current_player.piece
      @board.ask_for_slot(@piece, @ai)
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
    display_tie if @board.check_full
    display_win(@current_player.piece) if @board.check_win(@current_player.piece)
  end
end

def display_win(piece)
  @alive = false
  puts "#{piece} won!"
end

def display_tie
  @alive = false
  puts "It's a tie!"
end
