require 'spec_helper'
# child belongs_to parent and daycare
# may have many-to-many relationship...
 # separate parent_owner class???
describe 'Child' do
  before do
    @bey = Parent.create(:first_name => "Beyonce", :last_name => "Carter", :address => "125 billionaire row", :phone_number => "3338675309")

    @sir = Child.create(:first_name => "Sir", :last_name => "Carter")
    @blu = Child.create(:first_name => "Blu Ivy", :last_name => "Carter")

    @toddler = AgeGroup.create(:title => "toddler", :description => "1", :daycare_id => "1")

    end

# this should test for a name
# a name should include first and last name
    it "has a first name and last name" do
      expect(@sir.first_name).to eq("Sir")
      expect(@sir.last_name).to eq("Carter")
    end

    # this should test for assocation with parent
    it "belongs to a parent" do
      @bey.children << @blu
      @bey.children << @sir
      expect(@blu.parent).to eq(@bey)
      expect(@sir.parent).to eq(@bey)
    end

    it "belongs to an age group" do
    #@toddler=instance of age group
    #children table called on age group instance
    #shovel child instance onto children's table
    #expect child instance to  be a part of age group
      @toddler.children << @blu
      expect(@blu.age_group).to eq(@toddler)
    end

end
