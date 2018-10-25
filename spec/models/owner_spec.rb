require 'pry'
describe 'Owner' do
  before do
    # @user = User.create(:username => "test 123", :email => "test123@aol.com", :password => "test")
  # before do
  #   @figure = Figure.create(:name => "Fiorello LaGuardia")
  #
  #   @airport =  Landmark.create(:name => "LG Airport")
  #   @library = Landmark.create(:name => "Library")
  #
  #   @mayor = Title.create(:name => "Mayor")
  #   @councilman = Title.create(:name => "Councilman")

  end
# this should test for a name
# a name should have a first and a last name

  it "has a name" do
    # expect(@figure.name).to eq("Fiorello LaGuardia")
  end

# this should test for associations with parents
  it "has many parents" do
    # @figure.landmarks << @airport
    # @figure.landmarks << @library
    # expect(@figure.landmarks).to include(@airport)
    # expect(@figure.landmarks).to include(@library)
  end
# this should test for associations with children
  it "has many children" do
    # @figure.titles << @mayor
    # @figure.titles << @councilman
    # expect(@figure.titles).to include(@mayor)
    # expect(@figure.titles).to include(@councilman)
  end
end

# this should test for a secure password and authentication
# authenticated password should match user
  it 'has a secure password' do

    expect(@user.authenticate("dog")).to eq(false)

    expect(@user.authenticate("test")).to eq(@user)
  end
end
