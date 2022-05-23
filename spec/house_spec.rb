require './lib/house'
require './lib/room'

RSpec.describe House do
  describe "Iteration 2" do
    it "exists" do
      house = House.new("400000", "123 sugar lane")
      expect(house).to be_a House
    end

    it "it has a price" do
      house = House.new("400000", "123 sugar lane")
      expect(house.price).to eq(400000)
    end

    it "it has an address" do
      house = House.new("400000", "123 sugar lane")
      expect(house.address).to eq("123 sugar lane")
    end

    it "it has a rooms array" do
      house = House.new("400000", "123 sugar lane")
      expect(house.rooms).to eq([])
    end

    it "can add rooms" do
      house = House.new("400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      house.add_room(room_1)
      expect(house.rooms.empty?).to eq(false) #list current rooms, might need to set eq to something more specific
    end

    it "can have more than one room" do
      house = House.new("400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')
      house.add_room(room_1)
      house.add_room(room_1)
      expect(house.rooms.length).to eq(2)
    end
  end
end
