require 'rspec'
require 'segment'

RSpec.describe "Ruby kata" do
  context "A Segment" do
    context "horizontal" do
      it "computes length" do
        segment = Segment.new(from: Point.new(x: 0, y: 0), to: Point.new(x: 1, y: 0))
        expect(segment.distance).to eq 1
      end
    end

    context "trivial" do
      it "computes length" do
        segment = Segment.new(from: Point.new(x: 0, y: 0), to: Point.new(x: 0, y: 0))
        expect(segment.distance).to eq 0
      end
    end

    context "vertical" do
      it "computes length" do
        segment = Segment.new(from: Point.new(x: 0, y: 1), to: Point.new(x: 0, y: 2))
        expect(segment.distance).to eq 1
      end
    end

    context "general" do
      it "computes length" do
        segment = Segment.new(from: Point.new(x: 1, y: 1), to: Point.new(x: 2, y: 2))
        expect(segment.distance).to be_within(0.001).of(1.414)
      end
    end
  end

  context "A Path" do
    context "wich is empty" do
      it 'should render length' do
        length = Path.new(segments: []).length
        expect(length).to eq 0
      end
    end

    context "wich contains a single segment" do
      it 'should render length' do
        segment = Segment.new(from: Point.new(x: 0, y: 0), to: Point.new(x: 1, y: 0))
        length = Path.new(segments: [segment]).length
        expect(length).to eq 1
      end
    end

    context "wich contains two segments" do
      it 'should render length' do
        segment_1 = Segment.new(from: Point.new(x: 2, y: 1), to: Point.new(x: 3, y: 1))
        segment_2 = Segment.new(from: Point.new(x: 3, y: 1), to: Point.new(x: 3, y: 3))
        length = Path.new(segments: [segment_1, segment_2]).length
        expect(length).to eq 3
      end
    end
  end


end