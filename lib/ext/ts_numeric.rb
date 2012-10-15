class Numeric
  def to_time_sentence specificity = 3
    Time.to_sentence(self, specificity)
  end
  alias_method :to_ts, :to_time_sentence
end