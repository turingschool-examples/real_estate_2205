require './lib/room'
require './lib/house'

RSpec.describe Room do
  describe "Iteration 2" do
    it "house has price and address" do
      house = House.new("$400000", "123 sugar lane")

      expect(house.price).to eq(400000)
      expect(house.address).to eq("123 sugar lane")
    end
    it "house has empty array for rooms" do
      house = House.new("$400000", "123 sugar lane")

      expect(house.rooms).to eq([])
    end
    it "house can add rooms to array" do
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')
      house.add_room(room_1)
      house.add_room(room_2)

      expect(house.rooms).to eq([room_1, room_2])
    end
    it "house can check if above market value" do
      house = House.new("$400000", "123 sugar lane")
  end
end
