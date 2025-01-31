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

    deal_cards
    @players.each_value do |player|
      puts "#{player.name}: #{player.hand.compact.map { |hand| hand.index }}"
    end
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

  def deal_cards
    @cards.shuffle.each_slice(4) do |cards|
      @players[:a].hand << cards[0]
      @players[:b].hand << cards[1]
      @players[:c].hand << cards[2]
      @players[:d].hand << cards[3]
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.start
end
