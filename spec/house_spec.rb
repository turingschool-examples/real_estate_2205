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
      expect(house.price).to eql("$400000")
    end

    it "has an address" do
      house = House.new("$400000", "123 sugar lane")
      expect(house.address).to eql("123 sugar lane")
    end

    it "has no rooms by default" do
      house = House.new("$400000", "123 sugar lane")
      expect(house.rooms).to eql([])
    end

    it "adds rooms to the house" do
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')
      house.add_room(room_1)
      house.add_room(room_2)
      expect(house.rooms.count).to eql(2)
    end

    it 'returns true if home price is above market average' do
      house = House.new("$400000", "123 sugar lane")
      house1 = House.new("$600000", "123 mulberry lane")
      expect(house.above_market_average?).to be false
      expect(house1.above_market_average?).to be true
    end

    it 'selects rooms from a category' do
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')
      room_3 = Room.new(:living_room, 25, '15')
      room_4 = Room.new(:basement, 30, '41')
      house.add_room(room_1)
      house.add_room(room_2)
      house.add_room(room_3)
      house.add_room(room_4)
      expect(house.rooms_from_category(:bedroom).count).to eql(2)
      expect(house.rooms_from_category(:basement).count).to eql(1)

    end

    it 'finds the area of all rooms in a house' do
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 10, '15')
      house.add_room(room_1)
      house.add_room(room_2)
      expect(house.area).to eql(280)
    end

    it 'returns the details of the house' do
      house = House.new("$400000", "123 sugar lane")
      expect(house.details).to eql({"price" => 400000, "address" => "123 sugar lane"})
    end
  end
end
