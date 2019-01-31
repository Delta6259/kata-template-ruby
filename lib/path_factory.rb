class PathFactory
  attr_reader :from
  attr_reader :to
  attr_reader :segments


  def initialize(from:, to:, segments:)
    @from = from
    @to = to
    @segments = segments
  end


  def possible_paths(starting_point, ending_point, segments, paths = [])
    if segments.length == 0 && paths.length == 0
      []
    else
      if segments[0].from == starting_point && segments[0].to == ending_point
        Path.new(segments: [segments[0]])
      end
    end
  end

end