require './lib/room'
require './lib/house'

RSpec.describe House do
  describe "Iteration 2, 3, and 4" do
    it "exists" do
      house = House.new("$400000", "123 sugar lane")
      expect(house).to be_a(House)
    end

    it "has attributes" do
      house = House.new("$400000", "123 sugar lane")
      expect(house.price).to eq("$400000")
      expect(house.address).to eq("123 sugar lane")
      expect(house.rooms).to eq([])
    end

    it "can check if it's above market average" do
      house = House.new("$400000", "123 sugar lane")
      expect(house.above_market_average?).to eq(false)

    end

    it "has rooms" do
      room_1= Room.new(:bedroom, 10, '13')
      expect(room_1).to be_a(Room)
    end

    it "can have rooms added to itself" do
      room_1= Room.new(:bedroom, 10, '13')
      expect(room_1).to be_a(Room)
      house = House.new("$400000", "123 sugar lane")
      house.add_room(room_1)
      room_2 = Room.new(:living_room, 15, '12')
      house.add_room(room_2)
      room_3 = Room.new(:living_room, 25, '15')
      house.add_room(room_3)
      room_4 = Room.new(:basement, 30, '41')
      house.add_room(room_4)
      expect(house.rooms).to eq([room_1, room_2, room_3, room_4])
    end

    it "can return rooms from a certain category" do
      house = House.new("$400000", "123 sugar lane")
      room_1= Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:living_room, 15, '12')
      room_3 = Room.new(:living_room, 25, '15')
      room_4 = Room.new(:basement, 30, '41')
      house.add_room(room_1)
      house.add_room(room_2)
      house.add_room(room_3)
      house.add_room(room_4)
      expect(house.rooms_from_category(:bedroom)).to eq([room_1])
      expect(house.rooms_from_category(:basement)).to eq([room_4])
    end

    it "has an area" do
      house = House.new("$400000", "123 sugar lane")
      room_1= Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:living_room, 15, '12')
      room_3 = Room.new(:living_room, 25, '15')
      room_4 = Room.new(:basement, 30, '41')
      expect(room_1.area).to eq(130)
      expect(room_2.area).to eq(180)
      expect(room_3.area).to eq(375)
      expect(room_4.area).to eq(1230)
      expect(house.house_area).to eq(1915)

    end

    it "has a hash of attributes" do
      house = House.new("$400000", "123 sugar lane")
      expect(house.price).to eq("$400000")
      expect(house.address).to eq("123 sugar lane")
      expect(house.details).to eq({"price" => "$400000", "address" => "123 sugar lane"})

    end

    xit "can calculate its price per sq foot" do
      house = House.new("$400000", "123 sugar lane")

      expect(house.price).to eq("$400000")
      expect(house.price.to_i).to eq(400000)
      expect(house.price_per_square_foot).to eq(208.88)

    end

    xit "can sort rooms by area greatest to least" do
      house = House.new("$400000", "123 sugar lane")
      room_1= Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:living_room, 15, '12')
      room_3 = Room.new(:living_room, 25, '15')
      room_4 = Room.new(:basement, 30, '41')
      expect(room_1.area).to eq(130)
      expect(room_2.area).to eq(180)
      expect(room_3.area).to eq(375)
      expect(room_4.area).to eq(1230)
      expect(rooms_sorted_by_area).to eq([room_4, room_3, room_2, room_1])
  end

  end
end
