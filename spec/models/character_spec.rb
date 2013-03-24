require 'spec_helper'

describe Character do

  let(:user) { FactoryGirl.create(:user) }
  before { @character = user.characters.build(name: "Steve") }

  subject { @character }

  it { should respond_to(:name) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Character.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end

  describe "when user_id is not present" do
    before { @character.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank name" do
    before { @character.name = " " }
    it { should_not be_valid }
  end

  describe "with name that is too long" do
    before { @character.name = "a" * 141 }
    it { should_not be_valid }
  end
end
