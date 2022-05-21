require './lib/room'
require './lib/house'

RSpec.describe House do
  describe "Iteration 2" do
    it "exists" do
      house = House.new("$400000", "123 sugar lane")
      expect(house).to be_a House
    end

    it "can get price" do
      house = House.new("$400000", "123 sugar lane")
      expect(house.price).to eq(400000)
    end

    it "can get address" do
      house = House.new("$400000", "123 sugar lane")
      expect(house.address).to eq("123 sugar lane")
    end

    it "can get rooms" do
      house = House.new("$400000", "123 sugar lane")
      expect(house.rooms).to eq([])
    end

    it "can add rooms" do
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')
      expect(house.rooms).to eq([])
      house.add_room(room_1)
      house.add_room(room_2)
      expect(house.rooms.count).to eq(2)
      expect(house.rooms.first).to eq(room_1)
    end
  end

  describe "Iteration 3" do
    it "can tell you if it's above market value" do
      house = House.new("$400000", "123 sugar lane")
      expect(house.above_market_average?).to eq(false)
    end

    it "can tell you what rooms are in each category" do
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')
      room_3 = Room.new(:living_room, 25, '15')
      room_4 = Room.new(:basement, 30, '41')
      house.add_room(room_1)
      house.add_room(room_2)
      house.add_room(room_3)
      house.add_room(room_4)
      expect(house.rooms_from_category(:bedroom)).to eq([room_1, room_2])
      expect(house.rooms_from_category(:basement)).to eq([room_4])
    end

    it "can calculate the house area" do
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')
      room_3 = Room.new(:living_room, 25, '15')
      room_4 = Room.new(:basement, 30, '41')
      house.add_room(room_1)
      house.add_room(room_2)
      house.add_room(room_3)
      house.add_room(room_4)
      expect(house.area).to eq(1900)
    end

    it "can tell you house details" do
      house = House.new("$400000", "123 sugar lane")
      expect(house.details).to eq({"price" => 400000, "address" => "123 sugar lane"})
    end

  end
end
