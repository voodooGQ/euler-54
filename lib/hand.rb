require 'card'

class Hand
  attr_reader :cards, :values

  def initialize(str)
    @cards = str.split(' ').map{|card_str| Card.new(card_str)}
    @values = card_value_count
  end

  def of_a_kind?(num)
    @values.has_value?(num)
  end

  private

  # Get a hash of the card values (key) in the hand and the count (value)
  def card_value_count
    @cards.each_with_object({}) do |card, hash|
      hash.key?(card.value) ? hash[card.value] += 1 : hash[card.value] = 1
    end
  end
end
