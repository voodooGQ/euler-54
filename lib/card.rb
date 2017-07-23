class Card
  attr_reader :value, :suit

  FACE = {T: 10, J: 11, Q: 12, K: 13, A: 14}
  SUITS = {C: 'Clubs', D: 'Diamonds', H: 'Hearts', S: 'Spades'}

  def initialize(str)
    validate(str)
    @value  = FACE.has_key?(str[0].to_sym) ? FACE[str[0].to_sym] : str[0].to_i
    @suit   = str[1]
  end

  private

  def validate(str)
    unless str.kind_of?(String) && str.size == 2
      raise Exception, 'Card requires a 2 character string'
    end

    unless SUITS.has_key?(str[1].to_sym)
      raise Exception, 'Strings second character must be one of the following ' \
        'suit character codes (C,D,H,S)'
    end

    unless FACE.has_key?(str[0].to_sym) || (2..9).include?(str[0].to_i)
      raise Exception, 'Strings first character must be a number 2 - 9 or one' \
        'of the following character codes (T,J,Q,K,A)'
    end
  end
end
