class Board

  attr_reader :width, :height

  def initialize(width, height)
    @width = width
    @height = height

    @board = Array.new width
    (0..(height-1)).each do |i|
      @board[i] = Array.new height, false
    end
  end

  def has_block?(x,y)
    raise IndexError, "Invalid x: #{x}" if !(0..(width-1)).include?(x)
    raise IndexError, "Invalid y: #{y}" if !(0..(height-1)).include?(y)
    @board[x][y]
  end

  def set_block(x,y, val)
    @board[x][y] = val
  end

  def drop_piece(x, piece)
    y = where_would_piece_hit(x, piece)
    place_piece(x, y, piece)
  end

  def where_would_piece_hit(x, piece)
    (height-1).downto(1) do |y|
      if piece_is_blocked?(x,y,piece)
        return y
      end
    end

    0
  end

  def place_piece(x, y, piece)
    piece.block_list.each do |px,py|
      set_block(x+px,y+py,true)
    end
  end

  def apply_moves(moves, positioned_piece)
    moves.each do |move|
      positioned_piece.apply_move(self, move)
    end
  end

  private

  def piece_is_blocked?(x, y, piece)
    piece.base_blocks do |px,py|
      if has_block?(x+px, y+py-1)
        return true
      end
    end

    false
  end

end