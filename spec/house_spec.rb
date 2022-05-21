require './lib/room'
require './lib/house'

RSpec.describe House do
  describe 'iteration 2' do
    it "house is an instance of house" do
      house = House.new("$400000", "123 sugar lane")
      expect(house).to be_instance_of(House)
    end

    it "price of house" do
      house = House.new("$400000", "123 sugar lane")
      expect(house.price).to eq("$400000")
    end

    it "address of house" do
      house = House.new("$400000", "123 sugar lane")
      expect(house.address).to eq("123 sugar lane")
    end

    it "the house has no rooms" do
      house = House.new("$400000", "123 sugar lane")
      expect(house.rooms).to eq([])
    end

    it "has a new room" do
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')
      expect(room_1).to be_instance_of(Room)
    end

    it "has another new room" do
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')
      expect(room_2).to be_instance_of(Room)
    end

    it "add new rooms to the house" do
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')

      house.add_room(room_1)
      house.add_room(room_2)

      expect(house.rooms).to eq([room_1, room_2])
    end

  end
end
