class Route
  attr_reader :paths

  def initialize(paths: [])
    @paths = paths
    freeze
  end

  def shortest_route_path
    render_shortest_path(self.paths)
  end

  def crossed_paths(crossing_point:)
    self.paths.select { |path|
      path.segments.any? { |segment|
        crossing_point == segment.from || crossing_point == segment.to
      }
    }
  end

  def required_points_paths(crossing_points:)
    self.paths.select { |path|
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
      render_shortest_path(paths)
    end
  end

  private

    def render_shortest_path(paths)
      paths.min_by(&:length)
    end

    def check_segment_condition()

    end

end