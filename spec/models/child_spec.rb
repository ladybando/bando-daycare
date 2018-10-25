require 'pry'
# child belongs_to parent and daycare
# may have many-to-many relationship...
 # separate parent_owner class???
describe 'Child' do
  before do
  #   @user = User.create(:username => "test 123", :email => "test123@aol.com", :password => "test")
  # end

  # @figure = Figure.create(:name => "Fiorello LaGuardia")
  #     @airport =  Landmark.create(:name => "LG Airport", :year_completed => 1950)
  #     @library = Landmark.create(:name => "Library")

    end

# this should test for a name
# a name should include first and last name
    it "has a name" do
      # expect(@airport.name).to eq("LG Airport")
      # expect(@airport.year_completed).to eq(1950)
    end

    # this should test for assocation with parent
    it "belongs to a parent" do
      # @figure.landmarks << @airport
      # expect(@airport.figure).to eq(@figure)
    end
  end
end
