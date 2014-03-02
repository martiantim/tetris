class PositionedPiece

  attr_reader :piece, :x

  def initialize(piece, x)
    @piece = piece
    @x = x
  end

  def apply_move(board, move)
    case move
      when :LEFT
        @x -= 1
      when :RIGHT
        @x += 1
      when :DROP
        board.drop_piece(@x, @piece)
      else
        raise StandardError, "Invalid move: #{move}"
    end
  end

end