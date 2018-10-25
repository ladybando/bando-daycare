require 'spec_helper'
# child belongs_to parent and daycare
# may have many-to-many relationship...
 # separate parent_owner class???
describe 'Child' do
  before do
    @child = Child.create(:first_name => "Blue Ivy", :last_name => "Carter")
    @adult = Parent.create(:first_name => "Beyonce", :last_name => "Carter")
    #@group =  Daycare.create(:age_group => "1")

    end

# this should test for a name
# a name should include first and last name
    it "has a first name and last name" do
      expect(@child.first_name).to eq("Blue Ivy")
      expect(@child.last_name).to eq("Carter")
    end

    # this should test for assocation with parent
    it "belongs to a parent" do
      @child.parents << @adult
      expect(@adult.child).to eq(@adult)
    end

    # it "belongs to an age group" do
    #   @child.age_groups << @group
    #   expect(@group.child).to eq(@group)
    # end

end
