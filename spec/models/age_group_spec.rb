describe 'AgeGroup' do
  before do
    @daycare = Daycare.create(:address => "7 corporate drive", :phone_number => "8005885437")

    @parent_1 = Parent.create(:first_name => "Beyonce", :last_name => "Carter", :address => "125 billionaire row", :phone_number => "3338675309")
    @parent_2 = Parent.create(:first_name => "Shawn", :last_name => "Carter", :address => "125 billionaire row", :phone_number => "3338675309")

    @child_1 = Child.create(:first_name => "Blu Ivy", :last_name => "Carter")
    @child_2 = Child.create(:first_name => "Sir", :last_name => "Carter")

    @age_group = AgeGroup.create(:title => "toddler", :description => "1", :daycare_id => "1")

  end
  # this should test for an address
  # an address has numbers and letters
    it "has a title and description" do
       expect(@age_group.title).to eq("toddler")
       expect(@age_group.description).to eq("1")
    end
  # # this should test for a number with an area code
  # it should have 10 digits
    it "has a day care id" do
       expect(@age_group.daycare_id).to eq(1)
    end
# this should test for associations with parents
  it "has many parents" do
    @age_group.parents << @parent_1
    @age_group.parents << @parent_2
    expect(@age_group.parents).to include(@parent_1)
    expect(@age_group.parents).to include(@parent_2)
  end
# this should test for associations with children
  it "has many children" do
    @age_group.children << @child_1
    @age_group.children << @child_2
    expect(@age_group.children).to include(@child_1)
    expect(@age_group.children).to include(@child_2)

  end
end
