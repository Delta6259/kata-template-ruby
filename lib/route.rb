class Route
  attr_reader :paths

  def initialize(paths: [])
    @paths = paths
    freeze
  end

  def shortest_path
    @paths.min_by(&:length)
  end

  def crossed_paths(crossing_point:)
    @paths.select { |path|
      path.segments.any? { |segment|
        crossing_point == segment.from || crossing_point == segment.to
      }
    }
  end

  def required_points_paths(crossing_points:)
    @paths.select { |path|
      path.segments.any? { |segment|
        crossing_points.include?(segment.from)
        crossing_points.include?(segment.to)
      }
    }
  end

  def shortest_path_with_stops(crossing_points:)
    # prendre en compte le cas dans lequel il n'y a qu'un path qui n'a pas tous les points


    paths = @paths.select { |path|
      path.segments.any? { |segment|
        crossing_points.include?(segment.from)
        crossing_points.include?(segment.to)
      }
    }.min_by(&:length)

    if paths == nil
      []
    else
      paths
    end
  end

end