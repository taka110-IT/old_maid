#!/usr/bin/env ruby
# frozen_string_literal: true

class Game
  def start
    puts "Game Start!"
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.start
end
