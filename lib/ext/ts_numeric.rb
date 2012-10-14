class Numeric
  def time_sentence specificity = 3
    Time.sentence(self, specificity)
  end
end