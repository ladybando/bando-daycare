require 'pry'
describe 'Parent' do
  before do
    # @user = User.create(:username => "test 123", :email => "test123@aol.com", :password => "test")
  end
# this should test for a name
  it "has a name" do
    # expect(@mayor.name).to eq("Mayor")
  end
# this should test for an address
# an address has numbers and letters
  it "has an address" do
    # expect(@mayor.name).to eq("Mayor")
  end
# this should test for a number with an area code
# it should have 10 digits
  it "has a phone number" do
    # expect(@mayor.name).to eq("Mayor")
  end
# this should test for an association with a child or children
  it "has many children" do
    # @mayor.figures << @figure
    # expect(@mayor.figures).to include(@figure)
    # end
  end
# this should test for an association with the daycare
  it "belongs to owner" do
    # @mayor.figures << @figure
    # expect(@mayor.figures).to include(@figure)
    # end
  end

  # this should test for a secure password and should test that it is authenticated
  # authenticated should mean that password belongs to parent
  it 'has a secure password' do

    # expect(@user.authenticate("dog")).to eq(false)
    #
    # expect(@user.authenticate("test")).to eq(@user)
  end
end
