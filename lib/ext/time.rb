class Time
  def self.sentence seconds, specificity = 3

    return 'now' if seconds == 0

    ago = seconds < 0

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

    time.each_cons(2) do |this_time, next_time|
      next_time[:value], this_time[:value] = this_time[:value].divmod this_time[:conversion]
    end

    time = time.delete_if { |t| t[:value] == 0 }

    out = []
    time.reverse.each do |t|
      out << "#{t[:value]} #{t[:unit].pluralize t[:value]}"
      break if out.count == specificity
    end

    out.join(', ') + (ago ? ' ago' : '')

  end
end