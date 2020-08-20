# frozen_string_literal: true

require './tic_tac_toe'

# rubocop:di sable Metrics/BlockLength
describe 'tic_tac_toe' do
  describe Game do
    context 'when the game is underway' do
      before(:example) do
        @game = Game.new
      end
      it 'ends the game when X has three in a row' do
        @game.board.board_array = %w[X X X]
        expect(@game.board.check_win('X')).to be true
      end
      it 'ends the game when X has three in a row' do
        @game.board.board_array = %w[O O O]
        expect(@game.board.check_win('O')).to be true
      end
      context 'when adding a piece' do
        it 'adds the right piece to the right slot' do
          @game.board.add_piece('X', 7)
          expect(@game.board.board_array[6]).to eql('X')
        end
        it 'does not add the piece if the selected slot is invalid' do
          @game.board.board_array[6] = 'O'
          expect(@game.board.check_slot_eligibility(7)).to be false
        end
      end
    end
  end
end
