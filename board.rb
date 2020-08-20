# frozen_string_literal: true

WINS_ARRAY = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]].freeze

class Board
  attr_accessor :board_array
  def initialize
    @board_array = Array.new(9, '-')
  end

  def update_board
    puts <<-HEREDOC

    #{@board_array[0]} #{@board_array[1]} #{@board_array[2]}
    #{@board_array[3]} #{@board_array[4]} #{@board_array[5]}
    #{@board_array[6]} #{@board_array[7]} #{@board_array[8]} 

    HEREDOC
  end

  def ask_for_slot(piece, ai, slot = nil)
    slot = make_ai_move if ai && piece == 'O'
    slot = gets.chomp.to_i unless ai && piece == 'O'
    if check_slot_eligibility(slot)
      add_piece(piece, slot)
    else
      puts 'Invalid position. Try again.'
      ask_for_slot(piece, ai, slot)
    end
  end

  def check_slot_eligibility(slot)
    # TIL: Strings get converted to 0 if #to_i is called on them
    @board_array[slot - 1] == '-' && slot != 0 ? true : false
  end

  def add_piece(piece, slot)
    @board_array[slot - 1] = piece
  end

  def check_full
    !@board_array.include?('-')
  end

  def check_win(piece)
    WINS_ARRAY.each do |possible_win|
      @result = []
      possible_win.each_with_index do |slot, index|
        @result[index] = piece if @board_array[slot - 1] == piece
      end
      # puts "testing if #{possible_win} is a win: #{@result}"
      return true if @result.count(piece) == 3
    end
    false
  end

  def make_ai_move(ai_move = 0)
    return ai_move = rand(1..9) until @board_array[ai_move - 1] == '-' && ai_move != 0
  end
end
