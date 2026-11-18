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

  describe '#occupation' do
    subject(:board_occupation) { described_class.new }
    context 'when board is full' do
      it 'full returns true' do
        (1..9).each do |a|
          board_occupation.place('X', a)
        end

        expect(board_occupation.full?).to eq(true)
      end
    end
    context 'when position 2 is occupied' do
      it 'returns true' do
        board_occupation.place('X', 2)
        expect(board_occupation.occupied?(2)).to eq(true)
      end
    end
  end
end
