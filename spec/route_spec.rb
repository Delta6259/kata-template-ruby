require 'rspec'
require 'path'
require 'segment'
require 'point'
require 'route'

RSpec.describe "Route" do
  context "Wich contains empty list of paths" do
    it 'should render nil in place of shortest path' do
      route = Route.new()
      expect(route.shortest_path).to eq nil
    end
  end

  context "Wich contains only empty paths" do
    it 'should render the shortest path' do
      path = Path.new(segments: [])
      route = Route.new(paths: [path])
      expect(route.shortest_path).to eq path
    end
  end

  context "Wich contains a single path" do
    it 'should render the shortest path' do
      segment_1 = Segment.new(from: Point.new(x: 2, y: 1), to: Point.new(x: 3, y: 1))
      segment_2 = Segment.new(from: Point.new(x: 3, y: 1), to: Point.new(x: 3, y: 3))
      path = Path.new(segments: [segment_1, segment_2])

      route = Route.new(paths: [path])
      expect(route.shortest_path).to eq path
    end
  end

  context "Wich contains 2 paths" do
    it 'should render the shortest path' do
      path_1_segment_1 = Segment.new(from: Point.new(x: 2, y: 1), to: Point.new(x: 3, y: 1))
      path_1_segment_2 = Segment.new(from: Point.new(x: 3, y: 1), to: Point.new(x: 3, y: 3))

      path_2_segment_1 = Segment.new(from: Point.new(x: 2, y: 1), to: Point.new(x: 3, y: 1))
      path_2_segment_2 = Segment.new(from: Point.new(x: 3, y: 1), to: Point.new(x: 3, y: 2))

      longest_path = Path.new(segments: [path_1_segment_1, path_1_segment_2])
      shortest_path = Path.new(segments: [path_2_segment_1, path_2_segment_2])

      route = Route.new(paths: [longest_path, shortest_path])
      expect(route.shortest_path).to eq shortest_path
    end
  end
end