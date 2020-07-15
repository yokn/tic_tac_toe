# frozen_string_literal: true

class Player
  attr_reader :piece

  def initialize(piece)
    @piece = piece
  end
end
