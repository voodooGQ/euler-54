require 'spec_helper'

RSpec.describe 'Score' do
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

  it 'properly scores a royal flush' do
    expect(Score.new(royal_flush).points).to eq(10014)
  end

  it 'properly scores a straight flush' do
    expect(Score.new(straight_flush).points).to eq(9012)
  end

  it 'properly scores quads' do
    expect(Score.new(quads).points).to eq(8005)
  end

  it 'properly scores a full house' do
    expect(Score.new(full_house).points).to eq(7020)
  end

  it 'properly scores a flush' do
    expect(Score.new(flush).points).to eq(6024)
  end

  it 'properly scores a straight' do
    expect(Score.new(straight).points).to eq(5014)
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
