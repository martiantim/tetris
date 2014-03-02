class Simplayer

  def initialize

  end

  def get_moves(board, positioned_piece)
    best_col = get_best_column(board, positioned_piece.piece)

    moves = []
    if best_col >= positioned_piece.x
      (best_col - positioned_piece.x).times { moves << :RIGHT }
    else
      (positioned_piece.x - best_col).times { moves << :LEFT }
    end

    moves << :DROP
    moves
  end

  def get_best_column(board, piece)
    low_y = board.height-1
    move = 0
    (0..(board.width-piece.width)).each do |x|
      hit_y = board.where_would_piece_hit(x, piece)

      if hit_y < low_y
        low_y = hit_y
        move = x
      end
    end

    if low_y == board.height - 1
      raise StandardError, "Cannot make move, the board is full."
    end

    move
  end

end