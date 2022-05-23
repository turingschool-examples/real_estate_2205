require './lib/house'

RSpec.describe House do
  describe "Iteration 2" do
    it "exists" do
      house = House.new("$400000", "123 sugar lane")
      expect(house).to be_a House
    end
  end
end
