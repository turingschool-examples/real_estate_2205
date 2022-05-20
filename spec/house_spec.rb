require './lib/room'
require './lib/house'

RSpec.describe House do

  describe "Iteration 2" do

    house = House.new("$400000", "123 sugar lane")

    it "can make a house" do
      expect(house).to be_an_instance_of(House)
    end

    it "can check price" do
      expect(house.price).to eq(400000)
    end

    it "can check address" do
      expect(house.address).to eq("123 sugar lane")
    end

    it "starts with empty rooms array" do
      expect(house.rooms).to eq([])
    end

    it "can add rooms" do
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')
      house.add_room(room_1)
      house.add_room(room_2)
      expect(house.rooms).to eq([room_1, room_2])
    end
  end

  describe "Iteration 3" do

    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')
    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    it "has above_market_average?" do
      expect(house.above_market_average?).to be false
    end

    it "can list rooms_from_category" do
      expect(house.rooms_from_category(:bedroom)).to eq([room_1, room_2])
      expect(house.rooms_from_category(:basement)).to eq([room_4])
    end

    it "can calculate total house area" do
      expect(house.area).to eq(1900)
    end

    it "can make details hash" do
      expect(house.details).to eq({"price" => 400000, "address" => "123 sugar lane"})
    end

  end
end
