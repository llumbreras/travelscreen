require 'spec_helper'

describe Category do
  it { should validate_presence_of(:name) }
  
  it "has many videos" do
    comedy = Category.create(name: 'Comedy')
    up = Video.create(title: 'Up', description: 'A travel adventure', category: comedy)
    rio = Video.create(title: 'Rio', description: 'A Rio adventure', category: comedy)
    expect(comedy.videos).to eq([up, rio])
  end
end
