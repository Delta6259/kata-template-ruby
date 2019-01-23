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

