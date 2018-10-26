require 'spec_helper'

describe 'Parent' do

  before do
    @bando = Daycare.create(:address => "7 corporate drive", :phone_number => "8005885437")

    @bey = Parent.create(:first_name => "Beyonce", :last_name => "Carter", :address => "125 billionaire row", :phone_number => "3338675309")

    @blu = Child.create(:first_name => "Blu Ivy", :last_name => "Carter")
    @sir = Child.create(:first_name => "Sir", :last_name => "Carter")

    @toddler = AgeGroup.create(:title => "toddler", :description => "1", :daycare_id => "1")
  end

# this should test for a name
it "has a first name and last name" do
  expect(@bey.first_name).to eq("Beyonce")
  expect(@bey.last_name).to eq("Carter")
end

# this should test for an address
# an address has numbers and letters
  it "has an address" do
     expect(@bey.address).to eq("125 billionaire row")
  end

# # this should test for a number with an area code
# it should have 10 digits
  it "has a phone number" do
     expect(@bey.phone_number).to eq("3338675309")
  end

# # this should test for an association with a child or children
  it "has many children" do
    @bey.children << @blu
    @bey.children << @sir
    expect(@bey.children).to include(@blu)
    expect(@bey.children).to include(@sir)
  end

  #this should test for an association with the daycare
it "belongs to a daycare" do
  @bando.parents << @bey
  expect(@bey.daycare).to eq(@bando)
end

#this should test for an association with the age group
#shovel parent instance onto parent table
#expect parent instance to be a part of age group
it "belongs to an age group" do
  @toddler.parents << @bey
  expect(@bey.age_group).to eq(@toddler)
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
