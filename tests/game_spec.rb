#!/usr/bin/env ruby
$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')

require 'rspec'
require 'game'

describe 'Tetris Game' do

  it 'should always give square pieces' do
    game = Game.new

    10.times do
      game.next_piece.should eq(Piece.new)
    end
  end

  it "should put the first piece in bottom left" do
    game = Game.new

    game.play_turn
    game.play_turn

    board = game.board
    board.has_block?(0,0).should eq(true)
    board.has_block?(1,0).should eq(true)
    board.has_block?(2,0).should eq(true)
    board.has_block?(3,0).should eq(true)
    board.has_block?(4,0).should eq(false)
    board.has_block?(0,1).should eq(true)
    board.has_block?(1,1).should eq(true)
    board.has_block?(0, 2).should eq(false)
  end

end