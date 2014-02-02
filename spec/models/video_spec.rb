require 'spec_helper'

describe Video do
  it { should belong_to(:category) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }

  describe "search_by_title" do
    it "displays empty array if no match" do
      up = Video.create(title: "Up", description: "A travel adventure")
      expect(Video.search_by_title("Down")).to eq([])
    end
    it "displays array of one video if exact match" do
      up = Video.create(title: "Up", description: "A travel adventure")
      rio = Video.create(title: "Rio", description: "A Rio adventure")
      expect(Video.search_by_title("Up")).to eq([up])
    end
    it "displays array of one video if partial match" do
      up_to_you = Video.create(title: "Up to you", description: "An up of adventure")
      rio = Video.create(title: "Rio", description: "A Rio adventure")
      expect(Video.search_by_title("to")).to eq([up_to_you])
    end
    it "displays array of videos if multiple match ordered by created_at" do
      up_to_you = Video.create(title: "Up to you", description: "An up of adventure", created_at: 1.day.ago )
      bring_to_me = Video.create(title: "Bring to me", description: "Bring an adventure")
      expect(Video.search_by_title("to")).to eq([bring_to_me, up_to_you])
    end
    it "returns an empty array if search term is empty string" do
      up_to_you = Video.create(title: "Up to you", description: "An up of adventure", created_at: 1.day.ago )
      bring_to_me = Video.create(title: "Bring to me", description: "Bring an adventure")
      expect(Video.search_by_title("")).to eq([])
    end
  end
end
