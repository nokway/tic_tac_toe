# frozen_string_literal: true

require_relative '../lib/game_class'
require_relative '../lib/board_class'

describe GameClass do
  describe 'game_won' do
    context 'when top row is XXX' do
      subject(:board) { BoardClass.new }
      subject(:game_won) { described_class.new }
      let(:current_player) { 'X' }
      it 'makes game over' do
        allow(game_won).to receive(:ask_player).and_return(1, 4, 2, 5, 3, 6)

        winning_message = 'Player X Won!'

        expect(game_won).to receive(:puts).with(winning_message)
        game_won.play
      end
    end
  end
end
