class Hand
  attr_reader :cards, :values

  def initialize(cards)
    @cards  = cards
    @values = card_value_count
  end

  def one_pair?
    select_by_x_of_a_kind(2).size == 1
  end

  def two_pair?
    select_by_x_of_a_kind(2).size == 2
  end

  def trips?
    select_by_x_of_a_kind(3).size == 1
  end

  def quads?
    select_by_x_of_a_kind(4).size == 1
  end

  def straight?
    return false unless @values.size == 5
    keys = @values.keys
    keys.sort == (keys.min..keys.max).to_a
  end

  def flush?
    @cards.map(&:suit).uniq.size == 1
  end

  def full_house?
    @values.has_value?(3) && @values.has_value?(2)
  end

  def straight_flush?
    straight? && flush?
  end

  def royal_flush?
    return false unless flush?
    @values.keys.sort == [10,11,12,13,14]
  end

  def high_card
    high_card_in_sequence(@values)
  end

  # Helper function to get the modifier card in a sequence.
  # Indicates who wins in tying hand types
  def sequence_modifier(num)
    high_card_in_sequence(select_by_x_of_a_kind(num))
  end

  private
  # Abstract X of a kind in the hand
  def select_by_x_of_a_kind(num)
    @values.select{|k,v| v == num}
  end

  # Given a Hash combo find the highest card value
  def high_card_in_sequence(combo)
    combo.keys.sort.last || 0
  end

  # Get a hash of the card values (key) in the hand and the count (value)
  def card_value_count
    @cards.each_with_object({}) do |card, hash|
      hash[card.value] = hash.key?(card.value) ? (hash[card.value] += 1) : 1
    end
  end
end
