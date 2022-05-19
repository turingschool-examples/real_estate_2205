require './lib/room'
require './lib/house'

RSpec.describe House do
  describe "Iteration 2" do
    it "exists" do
      house = House.new("$400000", "123 sugar lane")
      expect(house).to be_a(House)
      expect(house.price).to eq("$400000")
      expect(house.address).to eq("123 sugar lane")
      expect(house.rooms).to eq([])
    end

    it "has rooms" do
      room_1= Room.new(:bedroom, 10, '13')
      expect(room_1).to be_a(Room)
    end
  end
end
