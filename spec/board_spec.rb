require_relative '../lib/board_class'
describe BoardClass do
  describe 'win condition' do
    context 'when upper row has X ' do
      subject(:board_win) { described_class.new }
      it 'returns true' do
        board_win.place('X', 1)
        board_win.place('X', 2)
        board_win.place('X', 3)

        expect(board_win.won?('X')).to eq(true)
      end
    end
  end
end
