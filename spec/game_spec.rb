# frozen_string_literal: true

require_relative '../lib/game_class'
require_relative '../lib/board_class'

describe GameClass do
  describe 'game ending gameclass' do
    context 'when board returns won do ' do
      subject(:game_won) { described_class.new(board) }
      let(:board) { instance_double(BoardClass, won?: true) }

      before do
      end
      it 'outputs the correct output message' do
        win_message = 'Player X Won!'
        expect(board).to receive(:won?).with('X')
        expect(game_won).to receive(:puts).with(win_message)
        game_won.play
      end
    end

    context 'when board returns full' do
      subject(:game_draw) { described_class.new(board) }
      let(:board) { instance_double(BoardClass, won?: false, full?: true) }

      it 'outputs correct draw message' do
        draw_message = 'Draw!'
        expect(board).to receive(:full?)
        expect(game_draw).to receive(:puts).with(draw_message)
        game_draw.play
      end
    end
  end
end
