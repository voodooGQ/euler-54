require 'spec_helper.rb'

describe 'Hand' do
  include_context 'poker_hands'

  it 'initializes a string of cards into an array of Card objects' do
    expect(royal_flush.cards).to be_kind_of(Array)
    expect(royal_flush.cards[0]).to be_kind_of(Card)
  end

  it 'contains the correct cards' do
    expect(royal_flush.cards[0].value).to eq(10)
    expect(royal_flush.cards[1].value).to eq(11)
    expect(royal_flush.cards[2].value).to eq(12)
    expect(royal_flush.cards[3].value).to eq(13)
    expect(royal_flush.cards[4].value).to eq(14)

    royal_flush.cards.each do |card|
      expect(card.suit).to eq('H')
    end
  end

  it 'detects a pair' do
    expect(one_pair.one_pair?).to eq(true)
    expect(high_card.one_pair?).to eq(false)
  end

  it 'detects two pair' do
    expect(two_pair.two_pair?).to eq(true)
    expect(one_pair.two_pair?).to eq(false)
  end

  it 'detects three of a kind' do
    expect(trips.trips?).to eq(true)
    expect(two_pair.trips?).to eq(false)
  end

  it 'detects four of a kind' do
    expect(quads.quads?).to eq(true)
    expect(trips.quads?).to eq(false)
  end

  it 'detects a straight' do
    expect(straight.straight?).to eq(true)
    expect(flush.straight?).to eq(false)
  end

  it 'detects a flush' do
    expect(flush.flush?).to eq(true)
    expect(straight.flush?).to eq(false)
  end

  it 'detects a full house' do
    expect(full_house.full_house?).to eq(true)
    expect(trips.full_house?).to eq(false)
    expect(one_pair.full_house?).to eq(false)
  end

  it 'detects a straight flush' do
    expect(straight_flush.flush?).to eq(true)
    expect(straight_flush.straight?).to eq(true)
    expect(straight_flush.straight_flush?).to eq(true)
    expect(straight.straight_flush?).to eq(false)
    expect(flush.straight_flush?).to eq(false)
  end

  it 'detects a royal flush' do
    expect(royal_flush.royal_flush?).to eq(true)
    expect(royal_flush.flush?).to eq(true)
    expect(royal_flush.straight?).to eq(true)
    expect(straight.royal_flush?).to eq(false)
    expect(flush.royal_flush?).to eq(false)
  end

  it 'returns the correct high card' do
    expect(high_card.high_card).to eq(14)
    expect(quads.high_card).to eq(3)
    expect(two_pair.high_card).to eq(10)
  end

  it 'can detect the high card in a sequence' do
    expect(two_pair.sequence_modifier(2)).to eq(10)
    expect(quads.sequence_modifier(4)).to eq(2)
    expect(royal_flush.sequence_modifier(3)).to eq(0)
  end

  it 'returns the high card object' do
    card = high_card.high_card_object
    expect(card.value).to eq(14)
    expect(card.suit).to eq('H')

    card = low_card.high_card_object
    expect(card.value).to eq(12)
    expect(card.suit).to eq('S')
  end
end
