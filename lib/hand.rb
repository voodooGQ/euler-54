require 'card'

class Hand
  attr_reader :cards

  def initialize(str)
    @cards = str.split(' ').map{|card_str| Card.new(card_str)}
  end
end
