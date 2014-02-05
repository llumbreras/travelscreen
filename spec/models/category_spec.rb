require 'spec_helper'

describe Category do
  it { should validate_presence_of(:name) }
  it { should have_many(:videos) }

  describe "#recent_videos" do
    it "returns videos in DESC order by created_at" do
      comedy = Category.create(name: "Comedy")
      up = Video.create(title: "Up", description: "An up adventure", category: comedy, created_at: 1.day.ago)
      rio = Video.create(title: "Rio", description: "A Rio adventure", category: comedy)
      expect(comedy.recent_videos).to eq([rio, up])
    end
    it "returns all videos if less than 6 videos" do
      comedy = Category.create(name: "Comedy")
      up = Video.create(title: "Up", description: "An up adventure", category: comedy, created_at: 1.day.ago)
      rio = Video.create(title: "Rio", description: "A Rio adventure", category: comedy)
      expect(comedy.recent_videos.count).to eq(2)
    end
    it "returns 6 videos if there are more than 6 videos" do
      comedy = Category.create(name: "Comedy")
      7.times { |x| Video.create(title: "Video-#{x}", description: "A video on #{x}", category: comedy) }
      expect(comedy.recent_videos.count).to eq(6)
    end
    it "returns the most recent 6 videos" do
      comedy = Category.create(name: "Comedy")
      up = Video.create(title: "Up", description: "An up adventure", category: comedy, created_at: 1.day.ago)
      6.times { |x| Video.create(title: "Video-#{x}", description: "A video on #{x}", category: comedy) }
      expect(comedy.recent_videos).not_to include([up])
    end
    it "returns empty array if category has no videos" do
      drama = Category.create(name: "Darama")
      expect(drama.recent_videos).to eq([])
    end
  end
end
