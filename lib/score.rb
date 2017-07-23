class Score
  attr_reader :hand, :points, :combo

  def initialize(hand)
    raise Exception, 'Only a hand of cards with value can be scored' unless hand.respond_to?('values')
    @hand = hand
    set_points_and_combo
  end

  private

  def set_points_and_combo
    if hand.royal_flush?
      points = 10000
      @combo = 'a Royal Flush'
    elsif hand.straight_flush?
      points = 9000
      @combo = 'a Straight Flush'
    elsif hand.quads?
      points = 8000 + hand.sequence_modifier(4)
      @combo = 'Quads'
    elsif hand.full_house?
      points = 7000 + hand.sequence_modifier(3)
      @combo = 'a Full House'
    elsif hand.flush?
      points = 6000
      @combo = 'a Flush'
    elsif hand.straight?
      points = 5000
      @combo = 'a Straight'
    elsif hand.trips?
      points = 4000 + hand.sequence_modifier(3)
      @combo = 'Trips'
    elsif hand.two_pair?
      points = 3000 + hand.sequence_modifier(2)
      @combo = 'Two Pair'
    elsif hand.one_pair?
      points = 2000 + hand.sequence_modifier(2)
      @combo = 'One Pair'
    else
      points = 1000
      @combo = "the High Card (#{hand.high_card_object.to_s})"
    end

    @points = points + hand.high_card
  end

  private

end
