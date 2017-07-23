require 'spec_helper.rb'

describe 'Poker' do
  let(:poker_string_1) { 'TH JH QH KH AH 4C 6C 8C TC QC' }
  let(:poker_string_2) { 'AH 2C 4D 5S 8H TH TC 9D 8C 7S' }
  let(:hand_to_small) { 'AH 2C 4D 5S 8H TH TC 9D 8C' }
  let(:hand_to_large) { 'AH 2C 4D 5S 8H TH TC 9D 8C 7S QC' }

  it 'raises an error when the string size does not produce 10 card strings' do
    expect { Poker.new(hand_to_small) }.to raise_error(Exception)
    expect { Poker.new(hand_to_large) }.to raise_error(Exception)
  end

  it 'generates the proper hand_1 based on the string supplied' do
    hand = Poker.new(poker_string_1).hand_1.cards
    expect(hand.first.suit).to eq('H')
    expect(hand.first.value).to eq(10)
    expect(hand.last.suit).to eq('H')
    expect(hand.last.value).to eq(14)
  end

  it 'generates the proper hand_2 based on the string supplied' do
    hand = Poker.new(poker_string_2).hand_2.cards
    expect(hand.first.suit).to eq('H')
    expect(hand.first.value).to eq(10)
    expect(hand.last.suit).to eq('S')
    expect(hand.last.value).to eq(7)
  end
end
