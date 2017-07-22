require 'card'

class Hand
  attr_reader :cards

  def initialize(str)
    str.split(' ').each do |card_str|
      (@cards ||= []) << Card.new(card_str)
    end
  end
end
