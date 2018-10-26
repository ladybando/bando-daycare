require 'spec_helper'
# child belongs_to parent and daycare
# may have many-to-many relationship...
 # separate parent_owner class???
describe 'Child' do
  before do
    @parent_1 = Parent.create(:first_name => "Beyonce", :last_name => "Carter", :address => "125 billionaire row", :phone_number => "3338675309")

    @child = Child.create(:first_name => "Sir", :last_name => "Carter")
    @blu = Child.create(:first_name => "Blu Ivy", :last_name => "Carter")
    #@group =  AgeGroup.create(:age_group => "1")

    end

# this should test for a name
# a name should include first and last name
    it "has a first name and last name" do
      expect(@child.first_name).to eq("Sir")
      expect(@child.last_name).to eq("Carter")
    end

    # this should test for assocation with parent
    it "belongs to a parent" do
      @parent_1.children << @blu
      expect(@blu.parent).to eq(@parent_1)
    end

    # it "belongs to an age group" do
    #   @child.age_groups << @group
    #   expect(@group.child).to eq(@group)
    # end

end
