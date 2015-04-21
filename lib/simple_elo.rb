require "simple_elo/version"

module SimpleElo
  extend self

  def calculate(player_rating, opponent_rating, k_factor, result)
    expected = expected(player_rating, opponent_rating)
    player_rating + modifier(result, expected, k_factor)
  end

  def expected(rating_a, rating_b)
    1.0 / ( 1.0 + ( 10.0 ** ((rating_a.to_f - rating_b.to_f) / 400.0) ) )
  end

  def modifier(result, expected, k_factor)
    k_factor * (result - expected)
  end
end
