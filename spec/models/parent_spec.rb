require 'spec_helper'
describe 'Parent' do
  before do
    @daycare = Daycare.create(:address => "7 corporate drive", :phone_number => "8005885437")

    @parent_1 = Parent.create(:first_name => "Beyonce", :last_name => "Carter", :address => "125 billionaire row", :phone_number => "3338675309")
    @parent_2 = Parent.create(:first_name => "Shawn", :last_name => "Carter", :address => "125 billionaire row", :phone_number => "3338675309")

    @child_1 = Child.create(:first_name => "Blu Ivy", :last_name => "Carter")
    @child_2 = Child.create(:first_name => "Sir", :last_name => "Carter")
  end

# this should test for a name
it "has a first name and last name" do
  expect(@parent_1.first_name).to eq("Beyonce")
  expect(@parent_1.last_name).to eq("Carter")
end

# this should test for an address
# an address has numbers and letters
  it "has an address" do
     expect(@parent_1.address).to eq("125 billionaire row")
  end

# # this should test for a number with an area code
# it should have 10 digits
  it "has a phone number" do
     expect(@parent_1.phone_number).to eq("3338675309")
  end

# # this should test for an association with a child or children
  it "has many children" do
    @parent_1.children << @child_1
    @parent_1.children << @child_2
    expect(@parent_1.children).to include(@child_1)
    expect(@parent_1.children).to include(@child_2)
  end

  #this should test for an association with the daycare
  it "belongs to a daycare" do
    @daycare.parents << @parent_2
    expect(@parent_2.daycare).to eq(@daycare)
  end

#this should test for an association with the age group
  it "belongs to age group" do
    @parent_1.age_groups << @toddlers
    expect(@parent_1.daycare).to include(@toddlers)
  end

#   # this should test for a secure password and should test that it is authenticated
#   # authenticated should mean that password belongs to parent
  # it 'has a secure password' do
  #
  #   expect(@parent_1.authenticate("nokids")).to eq(false)
  #
  #   expect(@parent_1.authenticate("mubaby")).to eq(@user)
  # end
end
