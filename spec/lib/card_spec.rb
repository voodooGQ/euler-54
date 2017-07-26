require 'spec_helper.rb'

describe 'Card' do
  let(:queen_of_hearts) { Card.new('QH') }
  let(:two_of_clubs) { Card.new('2C') }
  let(:ace_of_diamonds) { Card.new('AD') }
  let(:six_of_spades) { Card.new('6S') }

  it 'raises an error if the passed string param is not 2 characters' do
    expect{ Card.new('A') }.to raise_error(StandardError)
    expect{ Card.new('A10') }.to raise_error(StandardError)
  end

  it 'raises an error if the passed suit character code is not C,D,H, or S' do
    expect{ Card.new('AQ') }.to raise_error(StandardError)
    expect{ Card.new('AL') }.to raise_error(StandardError)
    expect{ Card.new('AB') }.to raise_error(StandardError)
  end

  it 'raises an error if the passed card value is not 2-9 or T,J,Q,K,A' do
    expect{ Card.new('1D') }.to raise_error(StandardError)
    expect{ Card.new('YD') }.to raise_error(StandardError)
    expect{ Card.new('10D') }.to raise_error(StandardError)
    expect{ Card.new('*S') }.to raise_error(StandardError)
  end

  it 'provides the correct suit' do
    expect(queen_of_hearts.suit).to eq('H')
    expect(two_of_clubs.suit).to eq('C')
    expect(ace_of_diamonds.suit).to eq('D')
    expect(six_of_spades.suit).to eq('S')
  end

  it 'provides the correct numeric value' do
    expect(queen_of_hearts.value).to eq(12)
    expect(two_of_clubs.value).to eq(2)
    expect(ace_of_diamonds.value).to eq(14)
    expect(six_of_spades.value).to eq(6)
  end

  it 'provides the correct human readable card name' do
    expect(queen_of_hearts.to_s).to eq('Queen of Hearts')
    expect(ace_of_diamonds.to_s).to eq('Ace of Diamonds')
    expect(six_of_spades.to_s).to eq('6 of Spades')
  end
end
