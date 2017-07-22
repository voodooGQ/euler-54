class Card
  attr_reader :value, :suit

  FACE = {T: 10, J: 11, Q: 12, K: 13, A: 14}

  def initialize(str)
    @value  = FACE.has_key?(str[0].to_sym) ? FACE[str[0].to_sym] : str[0].to_i
    @suit   = str[1]
  end
end
