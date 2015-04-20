require "simple_elo/version"

module SimpleElo
  extend self

  def expected(rating_a, rating_b)
    1.0 / ( 1.0 + ( 10.0 ** ((rating_a.to_f - rating_b.to_f) / 400.0) ) )
  end
end
