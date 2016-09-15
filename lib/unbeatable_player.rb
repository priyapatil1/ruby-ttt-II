class UnbeatablePlayer 

  attr_reader :mark
  attr_reader :current_move

  def initialize(mark)
    @mark = mark
  end

  def best_move(index, score)
    {:index => index, :score => score}
  end

  def negamax(board, mark)
    current_best = best_move(- 1, - 100)

    if board.full? || board.won?
      return best_move(- 1, - score(board)) 
    end

    board.all_empty_positions.each do |position|
      new_board = board.mark_empty_position(mark, position + 1)
      new_score = negamax(new_board, switch(mark))
      temp_score = (- new_score[:score])
      if temp_score > current_best[:score]
        current_best[:index] = position + 1
        current_best[:score ] = temp_score
      end
    end
    best_move(current_best[:index], current_best[:score])
  end

  def set_current_move(board)
    @current_move = negamax(board, mark)[:index]
  end

  private

  def switch(mark)
    mark == "X" ? "O" : "X"
  end

  def score(new_board)
    new_board.won? ? 1 : 0
  end

end
