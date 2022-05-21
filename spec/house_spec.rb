require './lib/room'
require './lib/house'

RSpec.describe House do
  describe "Iteration 2" do
    it "exists" do
      house = House.new("$400000", "123 sugar lane")

      expect(house).to be_a(House)
    end

    it 'has a price' do
      house = House.new("$400000", "123 sugar lane")

      expect(house.price).to eq("$400000")
    end

    it 'has an address' do
      house = House.new("$400000", "123 sugar lane")

      expect(house.address).to eq("123 sugar lane")
    end

    it 'has rooms which start empty' do
      house = House.new("$400000", "123 sugar lane")

      expect(house.rooms).to eq([])
    end

    it 'can add rooms' do
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')

      house.add_room(room_1)
      house.add_room(room_2)

      expect(house.rooms).to eq([room_1, room_2])
    end
  end
  describe "Iteration 3" do
    it 'can calculate above market average of $500,000' do
        house_1 = House.new("$400000", "123 sugar lane")
        house_2 = House.new("$600000", "123 sugar lane")

        expect(house_1.above_market_average?).to be false
        expect(house_2.above_market_average?).to be true
    end

    it 'can return rooms by category' do
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')
      room_3 = Room.new(:living_room, 25, '15')
      room_4 = Room.new(:basement, 30, '41')

      house.add_room(room_1)
      house.add_room(room_2)
      house.add_room(room_3)
      house.add_room(room_4)

      expect(house.rooms_from_category(:bedroom)).to eq([room_1, room_2])
    end

    it 'can add the room areas' do
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
  end
end
