require './lib/house'
require './lib/room'

RSpec.describe House do
  describe "Iteration 2+3" do
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

    xit "returns T/F if the house is about market value" do
      house = House.new("400000", "123 sugar lane")
      expect(house.above_market_value?).to eq(false)
    end

    xit "will list #rooms_from_category using symbol" do
      house = House.new("400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')
      room_3 = Room.new(:living_room, 25, '15')
      room_4 = Room.new(:basement, 30, '41')
      house.add_room(room_1)
      house.add_room(room_2)
      house.add_room(room_3)
      house.add_room(room_4)
      expect(house.rooms_from_category(:bedroom).count).to eq(2)
      expect(house.rooms_from_category(:basement).count).to eq(1)
    end

    xit "will calculate total area" do
      house = House.new("400000", "123 sugar lane")
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

    xit "will return a hash of house attributes" do
      house = House.new("400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')
      room_3 = Room.new(:living_room, 25, '15')
      room_4 = Room.new(:basement, 30, '41')
      house.add_room(room_1)
      house.add_room(room_2)
      house.add_room(room_3)
      house.add_room(room_4)
      expect(house.details.price).to eq(40000)
    end
  end
end
