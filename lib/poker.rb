class Poker
  attr_reader :game_string, :cards, :hand_1, :hand_2

  def initialize(str)
    @game_string  = str.split(' ')
    validate

    @cards        = card_factory
    @hand_1       = Hand.new(@cards[0..4])
    @hand_2       = Hand.new(@cards[5..9])
  end

  def declare_winner
    player_1 = Score.new(@hand_1)
    player_2 = Score.new(@hand_2)

    if player_1.points > player_2.points
      "Player 1 wins with #{player_1.combo}"
    elsif player_1.points < player_2.points
      "Player 2 wins with #{player_2.combo}"
    else
      "Players pushed with #{player_1.combo}"
    end
  end

  private

  def validate
    unless @game_string.size == 10
      raise Exception, 'You must pass a string with 10 card values to play ' \
        'poker'
    end
  end

  def card_factory
    @game_string.map{|card_str| Card.new(card_str)}
  end
end
