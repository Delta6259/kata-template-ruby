require 'rspec'
require 'path'
require 'segment'
require 'point'
require 'path_factory'

RSpec.describe "PathList" do

  context "when there is no segment" do
    it 'should not return all possible paths' do
      path_list = PathFactory.new(from: Point.new(x: 0, y: 0), to: Point.new(x: 1, y: 0))
      expect(path_list.all_possible_paths(segments: nil)).to eq []
    end
  end

  context "when there is 1 segment" do
    it 'should return all possible paths' do
      path_list = PathFactory.new(from: Point.new(x: 1, y: 1), to: Point.new(x: 2, y: 2))
      segments = [Segment.new(from: Point.new(x: 1, y: 1), to: Point.new(x: 2, y: 2))]
      expect(path_list.all_possible_paths(segments: segments)).to eq anything
    end
  end

  context "when there is no segment circle" do
    it 'should return all possible paths' do
    end
  end

  context "when there are segments with circles" do
    it 'should return all possible paths' do
    end
  end
end