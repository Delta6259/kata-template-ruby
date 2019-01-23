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
end