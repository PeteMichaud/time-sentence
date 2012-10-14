class Time
  def self.sentence seconds, specificity = 3
    time = [
        { value: seconds, unit: t(:second,      scope: :time_sentence), conversion: 60 },
        { value: 0,       unit: t(:minute,      scope: :time_sentence), conversion: 60 },
        { value: 0,       unit: t(:hour,        scope: :time_sentence), conversion: 24 },
        { value: 0,       unit: t(:day,         scope: :time_sentence), conversion: 7 },
        { value: 0,       unit: t(:week,        scope: :time_sentence), conversion: 4 },
        { value: 0,       unit: t(:month,       scope: :time_sentence), conversion: 12 },
        { value: 0,       unit: t(:year,        scope: :time_sentence), conversion: 10 },
        { value: 0,       unit: t(:decade,      scope: :time_sentence), conversion: 100 },
        { value: 0,       unit: t(:millennium,  scope: :time_sentence), conversion: nil },
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

    out.join ', '

  end
end