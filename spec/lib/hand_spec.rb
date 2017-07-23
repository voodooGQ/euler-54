require 'spec_helper.rb'

describe 'Hand' do
  let(:royal_flush) { Hand.new('TH JH QH KH AH') }
  let(:straight_flush) { Hand.new('2C 3C 4C 5C 6C') }
  let(:quads) { Hand.new('2C 2D 2S 2H 3C') }
  let(:full_house) { Hand.new('TH TC TS 9D 9C') }
  let(:flush) { Hand.new('4C 6C 8C TC QC') }
  let(:straight) { Hand.new('3S 4C 5H 6D 7C') }
  let(:trips) { Hand.new('TH TC TS 9D 8C') }
  let(:two_pair) { Hand.new('TH TC 9D 9C 8S') }
  let(:one_pair) { Hand.new('TH TC 9D 8C 7S') }
  let(:high_card) { Hand.new('AH 2C 4D 5S 8H') }

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

  it 'detects a straight flush' do
    expect(straight_flush.flush?).to eq(true)
    expect(straight_flush.straight?).to eq(true)
    expect(straight_flush.straight_flush?).to eq(true)
    expect(straight.straight_flush?).to eq(false)
    expect(flush.straight_flush?).to eq(false)
  end
end
