require './lib/room'
require './lib/house'
require 'pry'


RSpec.describe House do
  describe 'iteration 2' do
    it 'exists' do
      house = House.new("$400000", "123 sugar lane")
      expect(house).to be_a House

    end



    it 'has a price' do
      house = House.new("$400000", "123 sugar lane")
      expect(house.price).to eq("400000")

    end



    xit 'has an address' do
      house = House.new("$400000", "123 sugar lane")
      expect(house.address).to eq("123 sugar lane")

    end



    xit 'has no rooms' do
      house = House.new("$400000", "123 sugar lane")
      expect(house.rooms).to eq([])

    end



    xit 'adds rooms' do
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')
      house.add_room(room_1)
      house.add_room(room_2)
      expect(house.new). to eq([room_1, room_2])
    end
  end












end
