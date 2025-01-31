# frozen_string_literal: true

class Card
  attr_reader :suit, :rank, :index

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
    @index = "#{suit}#{rank}"
  end
end
