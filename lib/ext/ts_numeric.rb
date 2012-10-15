class Numeric
  def to_time_sentence specificity = 3
    Time.sentence(self, specificity)
  end
  alias_method :to_ts, :to_time_sentence
end