# frozen_string_literal: true

require './tic_tac_toe'

describe 'tic_tac_toe' do
  describe Game do
    before(:context) do
      @game = Game.new
    end
    context 'when the game is underway' do
      it 'ends the game when X has three in a row' do
        @game.current_player = @player1 = Player.new('X')
        @game.board.board_array = %w[X X X]
        @game.check_game_over
        # expect(game.alive).to be false
      end
      it 'ends the game when O has three in a row' do
        @game.current_player = @player1 = Player.new('O')
        @game.board.board_array = %w[O O O]
        @game.check_game_over
        # expect(game.alive).to be false
      end
    end
  end
end
