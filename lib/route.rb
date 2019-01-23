class Route
  attr_reader :paths

  def initialize(paths:)
    @paths = paths
    freeze
  end

  def shortest_path
    @paths.sort_by(&:length).first
  end
end