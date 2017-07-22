class Card
  attr_reader :value, :suit

  def initialize(stringified)
    @value  = stringified[0]
    @suit   = stringified[1]
  end
end
