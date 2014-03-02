require 'board'
require 'piece'
require 'positioned_piece'
require 'simplayer'


class Game
  attr_reader :board

  def initialize
    @board = Board.new(10, 40)
    @simulator = Simplayer.new()
  end

  def play
    while (true) do
      p play_turn
    end
  end

  def play_turn
    piece = next_piece
    positioned_piece = PositionedPiece.new(piece, 0)

    moves = @simulator.get_moves(@board, positioned_piece)

    @board.apply_moves(moves, positioned_piece)
    moves
  end

  def next_piece
    Piece.new
  end

end