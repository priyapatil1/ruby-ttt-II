require 'board' 
describe Board do 
  EMPTY_BOARD = Board.new(["-", "-", "-",
                           "-", "-", "-",
                           "-", "-", "-"])

  FULL_BOARD = Board.new(["X", "O", "X",
                          "X", "O", "O",
                          "O", "X", "X"])

  it 'determines if a board is empty' do 
    expect(EMPTY_BOARD.empty?).to eq true
  end

  it 'determines if a board is not empty' do
    expect(FULL_BOARD.empty?).to eq false 
  end

  it 'determines if a board is full' do 
    expect(FULL_BOARD.full?).to eq true 
  end

  it 'determines if a board is not full' do 
    expect(EMPTY_BOARD.full?).to eq false 
  end

end
