require "simple_elo/version"

module SimpleElo
  extend self

  def calculate(player_rating, opponent_rating, k_factor, result)
    expected = expected(player_rating, opponent_rating)
    player_rating + modifier(result, expected, k_factor)
  end

  def calculate_match(player1, player2, result)
    player1_rating = calculate(player1[:rating], player2[:rating], player1[:k_factor], result)
    player2_rating = calculate(player2[:rating], player1[:rating], player2[:k_factor], 1-result)
    [player1_rating, player2_rating]
  end

  def expected(rating_a, rating_b)
    1.0 / ( 1.0 + ( 10.0 ** ((rating_a.to_f - rating_b.to_f) / 400.0) ) )
  end

  def modifier(result, expected, k_factor)
    k_factor * (result - expected)
  end
end
