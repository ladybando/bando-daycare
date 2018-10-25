require 'spec_helper'
describe 'Daycare' do
  before do
    @toddlers = Daycare.create(:age_group => "1", :address => "7 corporate drive", :phone_number => "8005885437")
    @littles = Daycare.create(:age_group => "2", :address => "7 corporate drive", :phone_number => "8005885437")
    @pre_teen = Daycare.create(:age_group => "3", :address => "7 corporate drive", :phone_number => "8005885437")

    @parent_1 = Parent.create(:first_name => "Beyonce", :last_name => "Carter")
    @parent_2 = Parent.create(:first_name => "Shawn", :last_name => "Carter")

    @child_1 = Child.create(:first_name => "Blue Ivy", :last_name => "Carter")
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

  it "has many age_groups" do
    @daycare.age_groups << @toddlers
    @daycare.age_groups << @littles
    @daycare.age_groups << @littles
    expect(@daycare.children).to include(@toddlers)
    expect(@daycare.children).to include(@littles)
    expect(@daycare.children).to include(@pre_teen)
  end

end
