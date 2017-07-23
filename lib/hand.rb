#require './card.rb'
#require 'byebug'

class Hand
  attr_reader :cards, :values

  def initialize(str)
    @cards = str.split(' ').map{|card_str| Card.new(card_str)}
    @values = card_value_count
  end

  def one_pair?
    @values.select{|k,v| v == 2}.size == 1
  end

  def two_pair?
    @values.select{|k,v| v == 2}.size == 2
  end

  def trips?
    @values.select{|k,v| v == 3}.size == 1
  end

  def quads?
    @values.select{|k,v| v == 4}.size == 1
  end

  def straight?
    return false unless @values.size == 5
    keys = @values.keys
    keys.sort == (keys.min..keys.max).to_a
  end

  def flush?
    @cards.map(&:suit).uniq.size == 1
  end

  def straight_flush?
    self.straight? && self.flush?
  end

  def full_house?
    @values.has_value?(3) && @values.has_value?(2)
  end

  private

  # Get a hash of the card values (key) in the hand and the count (value)
  def card_value_count
    @cards.each_with_object({}) do |card, hash|
      hash.key?(card.value) ? hash[card.value] += 1 : hash[card.value] = 1
    end
  end
end
