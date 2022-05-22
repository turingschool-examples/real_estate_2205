require './lib/room'
require './lib/house'
require 'pry'

RSpec.describe House do
  describe "Iteration 2" do
    it "exists" do
      house = House.new("$400000", "123 sugar lane")

      expect(house).to be_a House
    end

    it "has a price" do
      house = House.new("$400000", "123 sugar lane")

      expect(house.price).to eq(400000)
    end

    it "has an address" do
      house = House.new("$400000", "123 sugar lane")

      expect(house.address).to eq("123 sugar lane")
    end

    it "has no rooms by default" do
      house = House.new("$400000", "123 sugar lane")

      expect(house.rooms).to eq([])
    end

    it "can add rooms" do
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')

      house.add_room(room_1)
      house.add_room(room_2)

      expect(house.rooms.first).to be_instance_of(Room)
      expect(house.rooms[0].category).to eq(:bedroom)
      expect(house.rooms[1].area).to eq(165)
      expect(house.rooms[0].painted).to eq(false)
    end
  end
end
