require 'spec_helper'

describe SimpleElo do
  it "calculates the expected value" do
    expect(SimpleElo.expected(1500.0, 1500.0)).to eq(0.5)
  end
end
