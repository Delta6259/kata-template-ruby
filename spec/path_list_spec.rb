require 'rspec'
require 'path'
require 'segment'
require 'point'
require 'path_list'

RSpec.describe "PathList" do

  context "when there is no segment" do
    it 'should not return the best path' do
      path_list = Pathlist.new(segments: nil)
      expect(path_list.all_possible_paths).to eq []
    end
  end

  context "when there is 1 segment" do
    it 'should return the best path' do
    end
  end

  context "when there is no segment circle" do
    it 'should return the best path' do
    end
  end

  context "when there are segments with circles" do
    it 'should return the best path' do
    end
  end
end