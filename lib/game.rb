class Poker
  attr_reader :game_string, :cards, :hand_1, :hand_2

  def initialize(str)
    @game_string  = str.split(' ')
    validate

    @cards        = card_factory
    @hand_1       = Hand.new(@cards[0..4])
    @hand_2       = Hand.new(@cards[5..9])
  end

  private

  def validate
    unless @game_string.size == 10
      raise Exception, 'You must pass a string with 10 card values to play ' \
        'poker'
    end
  end

  def card_factory
    @game_string.split(' ').map{|card_str| Card.new(card_str)}
  end
end
