class Piece

  #always a 2x2 block piece
  def block_list
    [[0,0],[1,0], [0,1], [1,1]]
  end

  def base_blocks
    block_list.find_all do |x,y|
      if y == 0
        yield [x,y]
      end
    end
  end

  def width
    2
  end

  def ==(obj)
    true
  end

end