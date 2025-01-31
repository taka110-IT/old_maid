#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "./card"
require_relative "./player"

class Game
  def initialize
    @cards = create_cards
    @players = create_players
  end

  def start
    puts "Game Start!"
    @cards.map {|card| puts("#{card.index}")}
    @players.each_value {|player| puts("#{player.name}")}
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

  def create_players
    players = {}
    %w[a b c d].each do |index|
      players[index.to_sym] = Player.new("player_#{index}")
    end
    players
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.start
end
