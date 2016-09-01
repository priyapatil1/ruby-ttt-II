require 'board' 
describe Board do 

  it 'determines if a board is empty' do 
    EMPTY_BOARD = Board.new(["-", "-", "-",
                             "-", "-", "-",
                             "-", "-", "-"])
    expect(EMPTY_BOARD.empty?).to eq true
  end
end
