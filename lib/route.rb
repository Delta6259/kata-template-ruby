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
    paths = required_points_paths(crossing_points: crossing_points)
    if paths.count == 0
      paths
    else
      paths.min_by(&:length)
    end
  end

end