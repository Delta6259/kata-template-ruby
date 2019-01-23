class Segment
  attr_reader :from, :to

  def initialize(from:, to:)
    @from = from
    @to = to
    freeze
  end

  def distance
    dx = from.x - to.x
    dy = from.y - to.y
    Math.sqrt(dx * dx + dy * dy)
  end
end

class Point
  attr_reader :x, :y

  def initialize(x: 0, y: 0)
    @x = x
    @y = y
    freeze
  end

  def +(other)
    Point.new(x: x + other.x, y: y + other.y)
  end

  def ==(other)
    x == other.x && y == other.y
  end

  def to_s
    "#{x}, #{y}"
  end
end

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

end
