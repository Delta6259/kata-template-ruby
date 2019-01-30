class PathFactory

  def initialize(from:, to:, segments:)
    @from = from
    @to = to
    @segments = segments
  end


  def possible_paths(starting_point, ending_point, segments, valid_paths = [])
    if segments.length == 0 && valid_paths.length == 0
      []
    else
      case segment[0].from
      when starting_point
        # On commence une nouvelle branche depuis le départ
        if segment[0].to == ending_point
          possible_paths(starting_point, ending_point, segments.drop(1), valid_paths << Path.new(segments: segments[0]))
        end
      else
        # On
      end
    end
  end

end