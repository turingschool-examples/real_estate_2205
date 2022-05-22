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

  end
end
