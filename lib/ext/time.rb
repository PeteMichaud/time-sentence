class Time

  # Converts number of seconds to human-readable sentences.
  #
  # == Examples
  #
  #   Time.sentence(1.hour) #=> "1 hour"
  #   Time.sentence(168.hours) #=> "1 week"
  #   Time.sentence(9999.seconds) #=> "2 hours, 46 minutes, 39 seconds"
  #   Time.sentence(123456876543.seconds) #=> "4 millennia, 25 decades, 2 years"
  #
  # == Params
  #
  # @param [Numeric] Number of seconds to convert to a sentence
  # @param [Integer] Specificity of the sentence (how many clauses are included)
  # @return [String] Generated sentence
  def self.sentence seconds, specificity = 3

    return 'now' if seconds == 0

    # if seconds is negative, then the time is in the past so later
    # on we'll append "ago" to the return string
    ago = seconds < 0

    # Tracks what the values and names of each unit, as well as the
    # conversion factor needed to go to the next larger unit
    time = [
        { value: seconds.abs,   unit: 'second',      conversion: 60 },
        { value: 0,             unit: 'minute',      conversion: 60 },
        { value: 0,             unit: 'hour',        conversion: 24 },
        { value: 0,             unit: 'day',         conversion: 7 },
        { value: 0,             unit: 'week',        conversion: 4 },
        { value: 0,             unit: 'month',       conversion: 12 },
        { value: 0,             unit: 'year',        conversion: 10 },
        { value: 0,             unit: 'decade',      conversion: 100 },
        { value: 0,             unit: 'millennium',  conversion: nil },
    ]

    # divmod returns both the result of a division and the remainder,
    # which is exactly what we need eg:
    # minutes, seconds = seconds.divmod 60
    time.each_cons(2) do |this_time, next_time|
      next_time[:value], this_time[:value] = this_time[:value].divmod this_time[:conversion]
    end

    # remove any elements that are 0, because we don't need them for the sentence
    time = time.delete_if { |t| t[:value] == 0 }

    # starting with the largest unit first, build the sentence elements
    out = []
    time.reverse.each do |t|
      out << "#{t[:value]} #{t[:unit].pluralize t[:value]}"
      # if we now have the right number of elements, then break
      break if out.count == specificity
    end

    out.join(', ') + (ago ? ' ago' : '')

  end
end