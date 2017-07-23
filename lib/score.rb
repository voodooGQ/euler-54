class Score
  attr_reader :hand

  def initialize(hand)
    raise Exception, 'Only a hand of cards with value can be scored' unless hand.respond_to?('values')
    @hand = hand
  end

  def points
    if hand.royal_flush?
      points = 10000
    elsif hand.straight_flush?
      points = 9000
    elsif hand.quads?
      points = 8000 + hand.low_card_in_combo(hand.select_by_x_of_a_kind(4))
    elsif hand.full_house?
      points = 7000 + hand.low_card_in_combo(hand.select_by_x_of_a_kind(3))
    elsif hand.flush?
      points = 6000
    elsif hand.straight?
      points = 5000
    elsif hand.trips?
      points = 4000 + hand.low_card_in_combo(hand.select_by_x_of_a_kind(3))
    elsif hand.two_pair?
      points = 3000 + hand.high_card_in_combo(hand.select_by_x_of_a_kind(2))
    elsif hand.one_pair?
      points = 2000 + hand.low_card_in_combo(hand.select_by_x_of_a_kind(2))
    end
    (points ||= 1000) + hand.high_card
  end

  private

end