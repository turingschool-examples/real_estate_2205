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

  describe "Iteration 3" do
    it "is not above market average" do
      house = House.new("$400000", "123 sugar lane")

      expect(house.above_market_average?).to equal(false)
    end

    it "can list rooms from category" do
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')
      room_3 = Room.new(:living_room, 25, '15')
      room_4 = Room.new(:basement, 30, '41')

      house.add_room(room_1)
      house.add_room(room_2)
      house.add_room(room_3)
      house.add_room(room_4)

      expect(house.rooms_from_category(:bedroom).count).to equal(2)
      expect(house.rooms_from_category(:bedroom)[0].area).to eq(130)
      expect(house.rooms_from_category(:bedroom)[1].area).to eq(165)
      expect(house.rooms_from_category(:basement).count).to equal(1)
      expect(house.rooms_from_category(:basement)[0].area).to eq(1230)
    end

    it "can calcuate its area" do
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

    it "can list its details" do
      house = House.new("$400000", "123 sugar lane")

      expect(house.details["price"]).to eq(400000)
      expect(house.details["address"]).to eq("123 sugar lane")
    end
  end

  describe "Iteration 4" do
    it "can calculate its price per sqft" do
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')
      room_3 = Room.new(:living_room, 25, '15')
      room_4 = Room.new(:basement, 30, '41')

      house.add_room(room_4)
      house.add_room(room_1)
      house.add_room(room_3)
      house.add_room(room_2)

      expect(house.price_per_sqare_foot).to eq(210.53)
    end

    it "can return a list of rooms sorted by area" do
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13') # area = 130
      room_2 = Room.new(:bedroom, 11, '15') # area = 165
      room_3 = Room.new(:living_room, 25, '15') # area = 375
      room_4 = Room.new(:basement, 30, '41') # area = 1230

      house.add_room(room_4)
      house.add_room(room_1)
      house.add_room(room_3)
      house.add_room(room_2)

      expect(house.rooms_sorted_by_area.first.category).to eq(:basement)
      expect(house.rooms_sorted_by_area[1].category).to eq(:living_room)
      expect(house.rooms_sorted_by_area[2].area).to eq(165)
      expect(house.rooms_sorted_by_area[3].area).to eq(130)
    end

    it "can return a hash of rooms by category" do
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13') # area = 130
      room_2 = Room.new(:bedroom, 11, '15') # area = 165
      room_3 = Room.new(:living_room, 25, '15') # area = 375
      room_4 = Room.new(:basement, 30, '41') # area = 1230

      house.add_room(room_4) # :basement
      house.add_room(room_1) # :bedroom, area = 130
      house.add_room(room_3) # :living_room
      house.add_room(room_2) # :bedroom, area = 165

      expect(house.rooms_by_category[:bedroom].count).to eq(2)
      expect(house.rooms_by_category[:bedroom].first.area).to eq(130)
      expect(house.rooms_by_category[:basement].first.area).to eq(1230)
      expect(house.rooms_by_category[:living_room].first.area).to eq(375)
    end
  end
end
