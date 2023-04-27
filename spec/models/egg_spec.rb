require "rails_helper"


describe "Egg Attribute Requirements on Create", :type => :model do
  context "validation tests" do
    it "ensures the title is present when creating egg" do
      egg = Egg.new(game: "Game Name", diffRating: 6, guide: "Guide Description")
      expect(egg.valid?).to eq(false)
    end
    it "should not be able to save egg when title missing" do
        egg = Egg.new(game: "Game Name", diffRating: 6, guide: "Guide Description")
      expect(egg.save).to eq(false)
    end
    it "ensures the game is present when creating egg" do
        egg = Egg.new(title: "Title", diffRating: 6, guide: "Guide Description")
        expect(egg.valid?).to eq(false)
      end
    it "should not be able to save egg when game missing" do
        egg = Egg.new(title: "Title", diffRating: 6, guide: "Guide Description")
    expect(egg.save).to eq(false)
    end
    it "should be able to save egg when have title and game" do
      egg = Egg.new(title: "Title", game: "Game Name")
      expect(egg.save).to eq(true)
    end
  end
end


describe "Egg Attribute Requirements on Edit", :type => :model do
  context "Edit Egg" do  
    before (:each) do
      @egg = Egg.create(title: "Title", game: "Game Name")
 
      end
    it "ensures the title is present when editing game" do
      @egg.update(:title => "New Title")
      expect(@egg.title == "New Title")
    end
    it "ensures the game is present when editing game" do
        @egg.update(:game => "New Game")
        expect(@egg.game == "New Game")
    end
    it "ensures the diffRating is present when editing game" do
        @egg.update(:diffRating => 6)
        expect(@egg.diffRating == 6)
      end
    it "ensures the guide is present when editing game" do
        @egg.update(:guide => "New Guide Description")
        expect(@egg.guide == "New Guide Description")
    end
  end
end
