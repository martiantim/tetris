#!/usr/bin/env ruby
$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')

require 'rspec'
require 'simplayer'

describe 'Player' do

  it 'should put piece in column 0 for empty board' do
    board = double("Board")
    allow(board).to receive(:width) { 10 }
    allow(board).to receive(:height) { 10 }
    allow(board).to receive(:where_would_piece_hit) { 0 }

    player = Simplayer.new
    player.get_best_column(board, Piece.new).should eq(0)
  end

  it 'should put piece in column 2 if 0 and 1 have blocks' do
    board = double("TetrisBoard")
    allow(board).to receive(:width) { 10 }
    allow(board).to receive(:height) { 10 }
    allow(board).to receive(:where_would_piece_hit) do |x, piece|
      if x < 2
        2
      else
        0
      end
    end

    player = Simplayer.new
    player.get_best_column(board, Piece.new).should eq(2)
  end

  it 'should give move to put piece in proper column' do
    board = double("TetrisBoard")
    allow(board).to receive(:width) { 10 }
    allow(board).to receive(:height) { 10 }
    allow(board).to receive(:where_would_piece_hit) { |x, piece| 0 }

    player = Simplayer.new
    positioned_piece = PositionedPiece.new(Piece.new, 2)
    player.get_moves(board, positioned_piece).should eq([:LEFT, :LEFT, :DROP])
  end
end