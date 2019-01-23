class Route
  attr_reader :paths

  def initialize(paths: [])
    @paths = paths
    freeze
  end

  def shortest_path
    if @paths.count > 0
      selected_paths = @paths.select { |path| path.length > 0 }
      if selected_paths.count > 0
        selected_paths.sort_by { |path| path.length }.first
      else
        nil
      end
    else
      nil
    end
  end
end