require './lib/room'
require './lib/house'

RSpec.describe House do

  describe "Iteration 2" do

    it "exists" do
      house = House.new("$400000", "123 sugar lane")

      expect(house).to be_instance_of(House)
    end

    it 'returns price' do
      house = House.new("$400000", "123 sugar lane")

      expect(house.price).to eq(400000)
    end

  end

end
