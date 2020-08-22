# frozen_string_literal: true

require './tic_tac_toe'

describe Game do
  context 'when the game is underway' do
    subject(:game) { Game.new }
    context 'when a player has met the winning condition' do
      it 'ends the game when X has three in a row' do
        game.board.board_array = %w[X X X]
        expect(game.board.check_win('X')).to be true
      end
      it 'ends the game when O has three in a row' do
        game.board.board_array = %w[O O O]
        expect(game.board.check_win('O')).to be true
      end
    end
    context 'when adding a piece' do
      it 'adds the right piece to the right slot' do
        game.board.add_piece('X', 7)
        expect(game.board.board_array[6]).to eql('X')
      end
      it 'does not add the piece if the selected slot is invalid' do
        game.board.board_array[6] = 'O'
        expect(game.board.check_slot_eligibility(7)).to be false
      end
    end
  end
end
