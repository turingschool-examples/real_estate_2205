require 'rspec'
require './lib/room'
require './lib/house'

RSpec.describe House do
  describe 'Iteration 2' do
    before :each do
      @house = House.new("$400000", "123 sugar lane")
      @room_1 = Room.new(:bedroom, 10, '13')
      @room_2 = Room.new(:bedroom, 11, '15')
      @room_x = Room.new(:basement, 20, '15')
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

      expect(@house.rooms).to eq([@room_1, @room_2])
            #robust test
      @house.add_room(@room_x)

      expect(@house.rooms).to eq([@room_1, @room_2, @room_x])
    end

    describe 'iteration 3' do
      before :each do
        @room_3 = Room.new(:living_room, 25, '15')
        @room_4 = Room.new(:basement, 30, '41')
        @house_x = House.new("$510000", "42 street 0")
      end

      it 'can tell if house is above mkt avg' do
        expect(@house.above_market_average?).to be(false)
           #robust test
        expect(@house_x.above_market_average?).to be(true)
      end

      it 'can tell rooms from a given category' do
        @house.add_room(@room_1)
        @house.add_room(@room_2)
        @house.add_room(@room_3)
        @house.add_room(@room_4)

        expect(@house.rooms_from_category(:bedroom)).to eq([@room_1, @room_2, @room_3, @room_4])
      end
    end
  end
end
