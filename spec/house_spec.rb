require 'rspec'
require './lib/room'
require './lib/house'

RSpec.describe House do
  describe 'Iteration 2' do
    before :each do
      @house = House.new("$400000", "123 sugar lane")
      @room_1 = Room.new(:bedroom, 10, '13')
      @room_2 = Room.new(:bedroom, 11, '15')
    end

    it 'exists' do
      expect(@house).to be_a(House)
    end

    it 'has attributes' do
      expect(@house.price).to eq(400000)
      expect(@house.address).to eq("123 sugar lane")
      expect(@house.rooms).to eq([])
    end

    it 'can add rooms to house' do
      @house.add_room(@room_1)
      @house.add_room(@room_2)

      expect(@house.rooms).to eq([@room1, @room2])
    end
  end
end
