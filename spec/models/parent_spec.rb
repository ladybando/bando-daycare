
require 'pry'
describe 'Parent' do
  before do
     @parent = Parent.create(:first_name => "Beyonce", :last_name => "Carter")
  end
# this should test for a name
  it "has a first name" do
     expect(@parent.first_name).to eq("Beyonce")
  end

  it "has a last name" do
     expect(@parent.last_name).to eq("Carter")
  end
# this should test for an address
# an address has numbers and letters
  it "has an address" do
     expect(@parent.address).to eq("125 billionaire row")
  end
# # this should test for a number with an area code
# it should have 10 digits
  it "has a phone number" do
     expect(@parent.phone_number).to eq("3338675309")
  end
# # this should test for an association with a child or children
  it "has many children" do
    @mayor.figures << @figure
    expect(@mayor.figures).to include(@figure)
    end
  end
# # this should test for an association with the daycare
#   it "belongs to owner" do
#     # @mayor.figures << @figure
#     # expect(@mayor.figures).to include(@figure)
#     # end
#   end
#
#   # this should test for a secure password and should test that it is authenticated
#   # authenticated should mean that password belongs to parent
  it 'has a secure password' do

    expect(@user.authenticate("nokids")).to eq(false)
    
    expect(@user.authenticate("mubaby")).to eq(@user)
  end
end
