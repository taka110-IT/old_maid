#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "./card"

class Game
  def initialize
    @cards = create_cards
  end

  def start
    puts "Game Start!"
    @cards.map {|card| puts("#{card.index}")}
  end

  private

  def create_cards
    cards = []
    cards << Card.new("joker", nil)
    %w[❤️ ♦️ ♠️ ♣️].product((1..13).to_a).each do |suit, rank|
      cards << Card.new(suit, rank)
    end
    cards
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.start
end
