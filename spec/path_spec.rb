require 'rspec'
require 'path'
require 'segment'
require 'point'

RSpec.describe "Paths" do
  context "For a single path" do
    context "wich is empty" do
      it 'should render length' do
        length = Path.new(segments: []).length
        expect(length).to eq 0
      end

      it 'should not render stops' do
        stops = Path.new(segments: []).stops
        expect(stops).to eq []
      end
    end

    context "wich contains a single segment" do
      it 'should render length' do
        segment = Segment.new(from: Point.new(x: 0, y: 0), to: Point.new(x: 1, y: 0))
        length = Path.new(segments: [segment]).length
        expect(length).to eq 1
      end

      it 'should render stop' do
        from = Point.new(x: 0, y: 0)
        to = Point.new(x: 1, y: 0)
        segment = Segment.new(from: from, to: to)
        stops = Path.new(segments: [segment]).stops
        expect(stops).to match_array([from, to])
      end
    end

    context "wich contains two segments" do
      it 'should render length' do
        segment_1 = Segment.new(from: Point.new(x: 2, y: 1), to: Point.new(x: 3, y: 1))
        segment_2 = Segment.new(from: Point.new(x: 3, y: 1), to: Point.new(x: 3, y: 3))
        length = Path.new(segments: [segment_1, segment_2]).length
        expect(length).to eq 3
      end

      it 'should render stops' do
        segment_1_from = Point.new(x: 0, y: 0)
        segment_1_to = Point.new(x: 1, y: 0)
        segment_1 = Segment.new(from: segment_1_from, to: segment_1_to)

        segment_2_from = Point.new(x: 1, y: 0)
        segment_2_to = Point.new(x: 2, y: 0)
        segment_2 = Segment.new(from: segment_2_from, to: segment_2_to)


        stops = Path.new(segments: [segment_1, segment_2]).stops
        expect(stops).to match_array([segment_1_from, segment_1_to, segment_2_from, segment_2_to])
      end
    end
  end
end