require './lib/room'
require './lib/house'

RSpec.describe House do
  describe "Iteration 2" do
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

    xit "can return rooms from a certain category" do
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
      expect(house.rooms_from_category(:living_room)).to eq[room_2, room_3]
    end

    it "has an area" do
      room_1= Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:living_room, 15, '12')
      room_3 = Room.new(:living_room, 25, '15')
      room_4 = Room.new(:basement, 30, '41')


    end
  end
end
