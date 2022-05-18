require './lib/room'
require './lib/house'

RSpec.describe House do
  describe "Iteration 2" do
    it "exists" do
      house = House.new("$400000", "123 sugar lane")
      expect(house).to be_a House
    end

    it "has a price" do
      house = House.new("$400000", "123 sugar lane")
      expect(house.price).to eq 400000
    end

    it "has an address" do
      house = House.new("$400000", "123 sugar lane")
      expect(house.address).to eq "123 sugar lane"
    end

    it "initializes with no rooms" do
      house = House.new("$400000", "123 sugar lane")
      expect(house.rooms).to eq []
    end

    it "can add rooms" do
      house = House.new("$400000", "123 sugar lane")
      expect(house.rooms).to eq []
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')
      house.add_room(room_1)
      house.add_room(room_2)
      expect(house.rooms).to eq [room_1, room_2]
    end

    it "is above market average if price > 500000" do
      house_1 = House.new("$400000", "123 sugar lane")
      house_2 = House.new("$575000", "1202 E 24th")
      expect(house_1.above_market_average?).to eq false
      expect(house_2.above_market_average?).to eq true
    end

    it "can list rooms from a category" do
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')
      room_3 = Room.new(:living_room, 25, '15')
      room_4 = Room.new(:basement, 30, '41')
      house.add_room(room_1)
      house.add_room(room_2)
      house.add_room(room_3)
      house.add_room(room_4)
      expect(house.rooms_from_category(:bedroom)).to eq [room_1, room_2]
      expect(house.rooms_from_category(:living_room)).to eq [room_3]
      expect(house.rooms_from_category(:patio)).to eq []
    end

    it "can calculate area based on areas of rooms" do
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')
      room_3 = Room.new(:living_room, 25, '15')
      room_4 = Room.new(:basement, 30, '41')
      house.add_room(room_1)
      house.add_room(room_2)
      house.add_room(room_3)
      house.add_room(room_4)
      expect(house.area).to eq 1900
    end

    it "returns a hash of details" do
      house = House.new("$400000", "123 sugar lane")
      expect(house.details).to eq {"price" => 400000, "address" => "123 sugar lane"}
    end
  end
end
