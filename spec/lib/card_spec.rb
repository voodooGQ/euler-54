require 'spec_helper.rb'

describe 'Card' do
  let(:queen_of_hearts) { Card.new('QH') }
  let(:two_of_clubs) { Card.new('2C') }
  let(:ace_of_diamonds) { Card.new('AD') }
  let(:six_of_spades) { Card.new('6S') }

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
end
