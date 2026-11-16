# frozen_string_literal: true

require_relative '../lib/game_class'
require_relative '../lib/board_class'

describe GameClass do
  describe 'game_won' do
    context 'when board returns won do ' do
      subject(:game_won) { described_class.new }
      let(:board) { instance_double(BoardClass) }

      before do
      end
      it 'outputs the correct output message' do
      end
    end
  end
end
