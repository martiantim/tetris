#!/usr/bin/env ruby
$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')

require 'rspec'
require 'piece'

describe 'Piece' do

  it 'should give list of block positions' do
    piece = Piece.new()

    piece.block_list.should eq([[0,0],[1,0], [0,1], [1,1]])
  end

  it 'should give back blocks' do
    piece = Piece.new()

    expect { |b| piece.base_blocks(&b) }.to yield_control.exactly(2).times
  end


  it 'should allow comparing objects' do
    piece1 = Piece.new()
    piece2 = Piece.new()

    piece1.should eq(piece2)
  end
end