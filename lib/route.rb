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
    @paths.select do |path|
      path.segments.any? do |segment|
        crossing_point == segment.from || crossing_point == segment.to
      end
    end
  end

end