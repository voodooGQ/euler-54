class Score
  attr_reader :hand

  def initialize(hand)
    raise 'Only a poker hand can be scored' unless hand.kind_of? Hand
    @hand = hand
  end

  def points
    if hand.royal_flush?
      points = 10000
    elsif hand.straight_flush?
      points = 9000 + hand.values.keys.sort.last
    elsif hand.quads?
      points = 8000 + hand.values.select{|k,v| v == 4}.keys[0]
    elsif hand.full_house?
      points = 7000 + hand.values.select{|k,v| v == 3}.keys[0]
    elsif hand.flush?
      points = 6000 + hand.values.keys.sort.last
    elsif hand.straight?
      points = 5000 + hand.values.keys.sort.last
    elsif hand.trips?
      points = 4000 + hand.values.select{|k,v| v == 3}.keys[0]
    elsif hand.two_pair?
      points = 3000 + hand.values.select{|k,v| v == 2}.keys.sort.last
    elsif hand.one_pair?
      points = 2000 + hand.values.select{|k,v| v == 2}.keys[0]
    end
    (points ||= 1000) + hand.high_card
  end
end
