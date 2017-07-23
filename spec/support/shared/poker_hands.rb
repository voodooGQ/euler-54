RSpec.shared_context "poker_hands", shared_context: :meta_data do
  # Royal Flush
  let(:royal_flush) do
    Hand.new([
      Card.new('TH'),
      Card.new('JH'),
      Card.new('QH'),
      Card.new('KH'),
      Card.new('AH')
    ])
  end

  # Straight Flush
  let(:straight_flush) do
    Hand.new([
      Card.new('2C'),
      Card.new('3C'),
      Card.new('4C'),
      Card.new('5C'),
      Card.new('6C')
    ])
  end

  # Quads (Four of a Kind)
  let(:quads) do
    Hand.new([
      Card.new('2C'),
      Card.new('2D'),
      Card.new('2S'),
      Card.new('2H'),
      Card.new('3C')
    ])
  end

  # Full House
  let(:full_house) do
    Hand.new([
      Card.new('TH'),
      Card.new('TC'),
      Card.new('TS'),
      Card.new('9D'),
      Card.new('9C')
    ])
  end

  # Flush
  let(:flush) do
    Hand.new([
      Card.new('4C'),
      Card.new('6C'),
      Card.new('8C'),
      Card.new('TC'),
      Card.new('QC')
    ])
  end

  # Straight
  let(:straight) do
    Hand.new([
      Card.new('3S'),
      Card.new('4C'),
      Card.new('5H'),
      Card.new('6D'),
      Card.new('7C')
    ])
  end

  # Trips (Three of a Kind)
  let(:trips) do
    Hand.new([
      Card.new('TH'),
      Card.new('TC'),
      Card.new('TS'),
      Card.new('9D'),
      Card.new('8C')
    ])
  end

  # Two Pair
  let(:two_pair) do
    Hand.new([
      Card.new('TH'),
      Card.new('TC'),
      Card.new('9D'),
      Card.new('9C'),
      Card.new('8S')
    ])
  end

  # One Pair
  let(:one_pair) do
    Hand.new([
      Card.new('TH'),
      Card.new('TC'),
      Card.new('9D'),
      Card.new('8C'),
      Card.new('7S')
    ])
  end

  # High Card
  let(:high_card) do
    Hand.new([
      Card.new('AH'),
      Card.new('2C'),
      Card.new('4D'),
      Card.new('5S'),
      Card.new('8H')
    ])
  end

  # Low Card (Loses to high card)
  let(:low_card) do
    Hand.new([
      Card.new('QS'),
      Card.new('TD'),
      Card.new('8H'),
      Card.new('6C'),
      Card.new('4S')
    ])
  end
end
