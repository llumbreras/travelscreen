require 'spec_helper'

describe Video do
  it "saves itself" do
    video = Video.new(title: 'Up', description: 'A travel adventure')
    video.save
    expect(Video.first).to eq(video)
  end
  it "belongs to category" do
    comedy = Category.create(name: 'Comedy')
    up = Video.create(title: 'Up', description: 'A travel adventure', category: comedy)
    rio = Video.create(title: 'Rio', description: 'A travel adventure', category: comedy)
    expect(comedy.videos).to eq([up, rio])
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
