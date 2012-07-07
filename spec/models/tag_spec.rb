require 'spec_helper'

describe Tag do
  describe "validations" do
    let(:tag) { build(:tag) }

    it "requires the name attribute to be present" do
      tag.should be_valid
      tag.name = nil
      tag.should_not be_valid
    end

    it "requires a unique name" do
      tag.should be_valid
      existing_tag = create(:tag)
      tag.name = existing_tag.name
      tag.should_not be_valid
    end
  end
end
