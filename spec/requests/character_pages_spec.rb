require 'spec_helper'

describe "Character pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "character creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a character" do
        expect { click_button "Post" }.not_to change(Character, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') } 
      end
    end

    describe "with valid information" do

      before { fill_in 'character_name', with: "Steve" }
      it "should create a character" do
        expect { click_button "Post" }.to change(Character, :count).by(1)
      end
    end
  end

  describe "character destruction" do
    before { FactoryGirl.create(:character, user: user) }

    describe "as correct user" do
      before { visit root_path }

      it "should delete a character" do 
        expect { click_link "delete" }.to change(Character, :count).by(-1)
      end
    end
  end
end