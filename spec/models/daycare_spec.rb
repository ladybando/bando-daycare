require 'spec_helper'
describe 'Daycare' do
  before do
    @age_group_1 = AgeGroup.create(:title => "toddler", :description => "1", :daycare_id => 1)
    @age_group_2 = AgeGroup.create(:title => "littles", :description => "2", :daycare_id => 1)

    @parent_1 = Parent.create(:first_name => "Beyonce", :last_name => "Carter", :address => "125 billionaire row", :phone_number => "3338675309")
    @parent_2 = Parent.create(:first_name => "Shawn", :last_name => "Carter", :address => "125 billionaire row", :phone_number => "3338675309")

    @daycare = Daycare.create(:address => "7 corporate drive", :phone_number => "8005885437")

    @child_1 = Child.create(:first_name => "Blu Ivy", :last_name => "Carter")
    @child_2 = Child.create(:first_name => "Sir", :last_name => "Carter")
  end
  # this should test for an address
  # an address has numbers and letters
    it "has an address" do
       expect(@daycare.address).to eq("7 corporate drive")
    end
  # # this should test for a number with an area code
  # it should have 10 digits
    it "has a phone number" do
       expect(@daycare.phone_number).to eq("8005885437")
    end
# this should test for associations with parents
  it "has many parents" do
    @daycare.parents << @parent_1
    @daycare.parents << @parent_2
    expect(@daycare.parents).to include(@parent_1)
    expect(@daycare.parents).to include(@parent_2)
  end
# this should test for associations with children
  it "has many children" do
    @daycare.children << @child_1
    @daycare.children << @child_2
    expect(@daycare.children).to include(@child_1)
    expect(@daycare.children).to include(@child_2)

  end


    it "has many age groups" do
      @daycare.age_groups << @age_group_1
      @daycare.age_groups << @age_group_2
      expect(@daycare.age_group).to include(@age_group_1)
      expect(@daycare.age_group).to include(@age_group_2)
    end
end
