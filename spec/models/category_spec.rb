require 'spec_helper'

describe Category do
  it "saves itself" do
    category = Category.new(name: 'Comedy')
    category.save
    expect(Category.first).to eq(category)
  end
  it "validates presence of name" do
    category = Category.create(name: '')
    expect(Category.count).to eq(0)
  end
  it "has many videos" do
    comedy = Category.create(name: 'Comedy')
    up = Video.create(title: 'Up', description: 'A travel adventure', category: comedy)
    rio = Video.create(title: 'Rio', description: 'A Rio adventure', category: comedy)
    expect(comedy.videos).to eq([up, rio])
  end
end
