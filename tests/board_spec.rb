#!/usr/bin/env ruby
$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')

require 'rspec'
require 'board'

describe 'Tetris Board' do

  it 'should give width and height' do
    board = Board.new(10,40)

    board.width.should eq(10)
    board.height.should eq(40)
  end

  it 'should initalize as empty' do
    board = Board.new(10,40)

    board.has_block?(0,0).should eq(false)
  end

  it 'should throw exception for invalid has_block coordinates' do
    board = Board.new(10,40)

    expect { board.has_block?(-1,0) }.to raise_error(IndexError)
    expect { board.has_block?(10,0) }.to raise_error(IndexError)
    expect { board.has_block?(0,-1) }.to raise_error(IndexError)
    expect { board.has_block?(0, 100) }.to raise_error(IndexError)
  end

  it 'should allow setting blocks' do
    board = Board.new(10,40)

    board.set_block(0,0,true)
    board.has_block?(0,0).should eq(true)
  end

  it 'can place pieces' do
    board = Board.new(10,10)

    board.place_piece(0,0,Piece.new)

    board.has_block?(0,0).should eq(true)
    board.has_block?(0,1).should eq(true)
    board.has_block?(0,2).should eq(false)
  end

  it 'allows dropping pieces' do
    board = Board.new(10,40)

    board.drop_piece(0, Piece.new)

    board.has_block?(0,0).should eq(true)
    board.has_block?(1,0).should eq(true)
    board.has_block?(2,0).should eq(false)
    board.has_block?(0,1).should eq(true)
    board.has_block?(1,1).should eq(true)
    board.has_block?(0, 2).should eq(false)
  end

  it 'can apply moves' do
    positioned_piece = double("PositionedPiece")
    allow(positioned_piece).to receive(:apply_move) { true }

    board = Board.new(10,10)
    board.apply_moves([:LEFT, :LEFT, :DROP], positioned_piece)
  end

end