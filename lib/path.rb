class Path
  attr_reader :segments

  def initialize(segments:)
    @segments = segments
    freeze
  end

  def length
    if @segments.count > 0
      @segments.map { |segment| segment.distance }.reduce(&:+)
    else
      0
    end
  end

  def stops
    @segments.map { |segment| [segment.from, segment.to] }.flatten
  end
end