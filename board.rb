# frozen_string_literal: true

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

  def add_piece(piece)
    @invalid_input = true
    while @invalid_input
      # TIL: Strings get converted to 0 if #to_i is called on them
      slot = gets.chomp.to_i
      if @board_array[slot - 1] == '-' && slot != 0
        @board_array[slot - 1] = piece
        @invalid_input = false
      else
        puts 'Please enter an empty slot'
      end
    end
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