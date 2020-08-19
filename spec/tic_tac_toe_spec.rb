# frozen_string_literal: true

require './tic_tac_toe'

# rubocop:disable Metrics/BlockLength
describe 'tic_tac_toe' do
  describe Game do
    # before(:context) do
    #   @game = Game.new
    # end
    context 'when the game is underway' do
      before(:example) do
        @game = Game.new
      end
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
      context 'when adding a piece' do
        it 'adds the right piece to the right slot' do
          @game.board.add_piece('X', 7)
          expect(@game.board.board_array[6]).to eql('X')
        end
        it 'asks for another slot if the selected slot is full' do
          @game.board.board_array[6] = 'O'
          expect(@game.board.check_slot_eligibility(7)).to be false
        end
      end
    end
  end
end
