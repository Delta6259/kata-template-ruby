require 'rspec'
require 'path'
require 'segment'
require 'point'
require 'route'

RSpec.describe "Route" do
  context "Wich contains empty list of paths" do
    it 'should render nil in place of shortest path' do
      route = Route.new()
      expect(route.shortest_route_path).to eq nil
    end

    it 'should render no crossed_paths' do
      route = Route.new()
      expect(route.crossed_paths(crossing_point: Point.new(x: 0, y: 0))).to eq []
    end

    it 'should render no required_points_paths' do
      route = Route.new()
      expect(route.required_points_paths(crossing_points: [Point.new(x: 0, y: 0), Point.new(x: 1, y: 0)])).to eq []
    end

    it 'should render no shortest_path_with_stops' do
      route = Route.new()
      expect(route.shortest_path_with_stops(crossing_points: [Point.new(x: 0, y: 0), Point.new(x: 1, y: 0)])).to eq []
    end
  end

  context "Wich contains only empty paths" do
    it 'should render the shortest path' do
      path = Path.new(segments: [])
      route = Route.new(paths: [path])
      expect(route.shortest_route_path).to eq path
    end
  end

  context "Wich contains a single path" do
    it 'should render the shortest path' do
      segment_1 = Segment.new(from: Point.new(x: 2, y: 1), to: Point.new(x: 3, y: 1))
      segment_2 = Segment.new(from: Point.new(x: 3, y: 1), to: Point.new(x: 3, y: 3))
      path = Path.new(segments: [segment_1, segment_2])

      route = Route.new(paths: [path])
      expect(route.shortest_route_path).to eq path
    end

    it 'should no render crossed path because it is not crossed by stop' do
      segment_1 = Segment.new(from: Point.new(x: 2, y: 1), to: Point.new(x: 3, y: 1))
      segment_2 = Segment.new(from: Point.new(x: 3, y: 1), to: Point.new(x: 3, y: 3))
      path = Path.new(segments: [segment_1, segment_2])

      route = Route.new(paths: [path])

      expect(route.crossed_paths(crossing_point: Point.new(x: 5, y: 5))).to eq []
    end

    it 'should render crossed path because it is crossed by stop' do
      segment_1 = Segment.new(from: Point.new(x: 2, y: 1), to: Point.new(x: 3, y: 1))
      segment_2 = Segment.new(from: Point.new(x: 3, y: 1), to: Point.new(x: 3, y: 3))
      path = Path.new(segments: [segment_1, segment_2])
      route = Route.new(paths: [path])
      expect(route.crossed_paths(crossing_point: Point.new(x: 3, y: 3))).to eq [path]
    end

    it 'should not render required_points_paths because the path has not all required points' do
      segment_1 = Segment.new(from: Point.new(x: 2, y: 1), to: Point.new(x: 3, y: 1))
      segment_2 = Segment.new(from: Point.new(x: 3, y: 1), to: Point.new(x: 3, y: 3))
      path = Path.new(segments: [segment_1, segment_2])
      route = Route.new(paths: [path])
      expect(route.required_points_paths(crossing_points: [Point.new(x: 2, y: 1), Point.new(x: 9, y: 9)])).to eq []
    end

    it 'should not render required_points_paths' do
      segment_1 = Segment.new(from: Point.new(x: 2, y: 1), to: Point.new(x: 3, y: 1))
      segment_2 = Segment.new(from: Point.new(x: 3, y: 1), to: Point.new(x: 3, y: 3))
      path = Path.new(segments: [segment_1, segment_2])
      route = Route.new(paths: [path])
      expect(route.required_points_paths(crossing_points: [Point.new(x: 2, y: 1), Point.new(x: 3, y: 3)])).to eq [path]
    end

    it 'should not render shortest_path_with_stops because it not has all required points' do
      segment_1 = Segment.new(from: Point.new(x: 2, y: 1), to: Point.new(x: 3, y: 1))
      segment_2 = Segment.new(from: Point.new(x: 3, y: 1), to: Point.new(x: 3, y: 6))
      path = Path.new(segments: [segment_1, segment_2])
      route = Route.new(paths: [path])
      expect(route.shortest_path_with_stops(crossing_points: [Point.new(x: 2, y: 1), Point.new(x: 3, y: 3)])).to eq []
    end

    it 'should render shortest_path_with_stops because it has all required points' do
      segment_1 = Segment.new(from: Point.new(x: 2, y: 1), to: Point.new(x: 3, y: 1))
      segment_2 = Segment.new(from: Point.new(x: 3, y: 1), to: Point.new(x: 3, y: 3))
      segment_3 = Segment.new(from: Point.new(x: 3, y: 3), to: Point.new(x: 3, y: 10))
      path_1 = Path.new(segments: [segment_1, segment_3])
      path_2 = Path.new(segments: [segment_1, segment_2])
      route = Route.new(paths: [path_1, path_2])
      expect(route.shortest_path_with_stops(crossing_points: [Point.new(x: 2, y: 1), Point.new(x: 3, y: 3)])).to eq path_2
    end

    it 'should render shortest_path_with_stops because it has all required points (One path)' do
      segment_1 = Segment.new(from: Point.new(x: 2, y: 1), to: Point.new(x: 3, y: 1))
      segment_2 = Segment.new(from: Point.new(x: 3, y: 1), to: Point.new(x: 3, y: 3))
      path = Path.new(segments: [segment_1, segment_2])
      route = Route.new(paths: [path])
      expect(route.shortest_path_with_stops(crossing_points: [Point.new(x: 2, y: 1), Point.new(x: 3, y: 3)])).to eq path
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
      expect(route.shortest_route_path).to eq shortest_path
    end
  end
end