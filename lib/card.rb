class Card
  attr_reader :value, :suit

  # Face card values
  FACE = {
    T: 10,
    J: 11,
    Q: 12,
    K: 13,
    A: 14
  }

  # Face card full names (based on their values)
  NAMES = {
    '11' => 'Jack',
    '12' => 'Queen',
    '13' => 'King',
    '14' => 'Ace'
  }

  # Suit full names
  SUITS = {
    C: 'Clubs',
    D: 'Diamonds',
    H: 'Hearts',
    S: 'Spades'
  }

  def initialize(str)
    validate(str)
    @value  = FACE.has_key?(str[0].to_sym) ? FACE[str[0].to_sym] : str[0].to_i
    @suit   = str[1]
  end

  # Return the 'human readable' name of the card
  def to_s
    val_str = @value.to_s
    human_value = NAMES.has_key?(val_str) ? NAMES[val_str] : val_str
    "#{human_value} of #{SUITS[@suit.to_sym]}"
  end

  private

  def validate(str)
    unless str.kind_of?(String) && str.size == 2
      raise StandardError, 'Card requires a 2 character string'
    end

    unless SUITS.has_key?(str[1].to_sym)
      raise StandardError, 'Strings second character must be one of the following ' \
        'suit character codes (C,D,H,S)'
    end

    unless FACE.has_key?(str[0].to_sym) || (2..9).include?(str[0].to_i)
      raise StandardError, 'Strings first character must be a number 2 - 9 or one' \
        'of the following character codes (T,J,Q,K,A)'
    end
  end
end
