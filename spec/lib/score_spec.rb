require 'spec_helper'

RSpec.describe 'Score' do
  include_context 'poker_hands'

  it 'raises an error when it cannot query a "values" method/accessor' do
    expect { Score.new(Object.new) }.to raise_error(Exception)
  end

  it 'properly scores a royal flush' do
    expect(Score.new(royal_flush).points).to eq(10014)
  end

  it 'properly scores a straight flush' do
    expect(Score.new(straight_flush).points).to eq(9006)
  end

  it 'properly scores quads' do
    expect(Score.new(quads).points).to eq(8005)
  end

  it 'properly scores a full house' do
    expect(Score.new(full_house).points).to eq(7020)
  end

  it 'properly scores a flush' do
    expect(Score.new(flush).points).to eq(6012)
  end

  it 'properly scores a straight' do
    expect(Score.new(straight).points).to eq(5007)
  end

  it 'properly scores trips' do
    expect(Score.new(trips).points).to eq(4020)
  end

  it 'properly scores two pair' do
    expect(Score.new(two_pair).points).to eq(3020)
  end

  it 'properly scores a pair' do
    expect(Score.new(one_pair).points).to eq(2020)
  end

  it 'properly scores a high card' do
    expect(Score.new(high_card).points).to eq(1014)
  end
end
