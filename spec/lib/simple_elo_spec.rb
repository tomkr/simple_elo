require 'spec_helper'

describe SimpleElo do
  it "calculates a player's rating" do
    player_rating = 1500.0
    opponent_rating = 1500.0
    k_factor = 20
    expect(SimpleElo.calculate(player_rating, opponent_rating, k_factor, 1)).to eq(1510)
  end

  it "calculates the expected result" do
    expect(SimpleElo.expected(1500.0, 1500.0)).to eq(0.5)
  end

  it "calculates the rating modifier" do
    expect(SimpleElo.modifier(1, 0.5, 10)).to eq(5.0)
  end
end
