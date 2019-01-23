require 'rspec'
require 'segment'
require 'point'

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
end