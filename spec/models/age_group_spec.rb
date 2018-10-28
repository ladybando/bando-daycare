require 'spec_helper'
describe 'AgeGroup' do
  before do
    @bando = Daycare.create(:address => "7 corporate drive", :phone_number => "8005885437")

    @bey = Parent.create(:first_name => "Beyonce", :last_name => "Carter", :address => "125 billionaire row", :phone_number => "3338675309")
    @jay = Parent.create(:first_name => "Shawn", :last_name => "Carter", :address => "125 billionaire row", :phone_number => "3338675309")

    @blu = Child.create(:first_name => "Blu Ivy", :last_name => "Carter")
    @sir = Child.create(:first_name => "Sir", :last_name => "Carter")

    @toddler = AgeGroup.create(:title => "toddler", :description => "1", :daycare_id => "1")

  end
  # this should test for an address
  # an address has numbers and letters
  it "has a title and description" do
     expect(@toddler.title).to eq("toddler")
     expect(@toddler.description).to eq("1")
  end
  # # this should test for a number with an area code
  # it should have 10 digits
  it "has a day care id" do
     expect(@toddler.daycare_id).to eq(1)
  end

  it "belongs to a daycare" do

    #age group table called on daycare instance
    #shovel age group instance onto group table
    #expect age group instance to be a part of daycare
      @bando.age_groups << @toddler
      expect(@toddler.daycare).to eq(@bando)
  end
# this should test for associations with parents
  # it "has many parents" do
  #   @toddler.parents << @bey
  #   @toddler.parents << @jay
  #   expect(@toddler.parents).to include(@bey)
  #   expect(@toddler.parents).to include(@jay)
  # end

# this should test for associations with children
  it "has many children" do
    @toddler.children << @blu
    @toddler.children << @sir
    expect(@toddler.children).to include(@blu)
    expect(@toddler.children).to include(@sir)
  end
end
