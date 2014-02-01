require 'spec_helper'

describe Video do
  it "saves itself" do
    video = Video.new(title: 'Up', description: 'A travel adventure')
    video.save
    expect(Video.first).to eq(video)
  end
  it "validates if title is present" do
    video = Video.new(title: '', description: 'A travel adventure')
    video.save
    expect(Video.count).to eq(0)
  end
  it "validates if description is present" do
    video = Video.new(title: 'Up', description: '')
    video.save
    expect(Video.count).to eq(0)
  end
end
