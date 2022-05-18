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
      expect(house.details.keys).to eq ['price', 'address']
      expect(house.details.values).to eq [400000, "123 sugar lane"]
    end

    it "returns the price per square foot" do
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')
      room_3 = Room.new(:living_room, 25, '15')
      room_4 = Room.new(:basement, 30, '41')
      house.add_room(room_1)
      house.add_room(room_2)
      house.add_room(room_3)
      house.add_room(room_4)
      expect(house.price_per_square_foot).to eq 210.53
    end

    xit "can sort rooms by area" do
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13') #130
      room_2 = Room.new(:bedroom, 11, '15') #165
      room_3 = Room.new(:living_room, 25, '15') #375
      room_4 = Room.new(:basement, 30, '41') #1230
      house.add_room(room_1)
      house.add_room(room_2)
      house.add_room(room_3)
      house.add_room(room_4)
      expect(house.rooms_sorted_by_area).to eq [room_4, room_3, room_2, room_1]
    end

    it "can return a has of rooms by category" do
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13') #130
      room_2 = Room.new(:bedroom, 11, '15') #165
      room_3 = Room.new(:living_room, 25, '15') #375
      room_4 = Room.new(:basement, 30, '41') #1230
      house.add_room(room_1)
      house.add_room(room_2)
      house.add_room(room_3)
      house.add_room(room_4)

      expected_return = {
        :bedroom=>[room_1, room_2],
        :living_room=>[room_3],
        :basement=>[room_4]
      }

      expect(house.rooms_by_category).to eq expected_return
    end
  end
end
