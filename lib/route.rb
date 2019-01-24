class Route
  attr_reader :paths

  def initialize(paths: [])
    @paths = paths
    freeze
  end

  def shortest_path
    if @paths.count > 0
      @paths.sort_by { |path| path.length }.first
    else
      nil
    end
  end

  def crossed_paths(crossing_point:)
    # TODO : Réussir à rendre ça immutable
    result = []

    @paths.each do |path|
      path.segments.each do |segment|
        if crossing_point == segment.from || crossing_point == segment.to
          result.push(path)
        end
      end
    end
    result

  end
end