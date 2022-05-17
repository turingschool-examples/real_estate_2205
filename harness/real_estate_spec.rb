require 'rspec'
require 'pry'
require 'simplecov'
SimpleCov.start
require './lib/room'
require './lib/house'


RSpec.configure do |config|
  config.default_formatter = 'doc'
end

RSpec.describe 'Real Estate Spec Harness' do
  describe '1 Iteration' do
    before :each do
      @room = Room.new(:bedroom, 10, 13)
    end

    it '1. Room instantiation' do
      expect(Room).to respond_to(:new).with(3).argument
      expect(@room).to be_an_instance_of(Room)

      expect(@room).to respond_to(:category).with(0).argument
      expect(@room.category).to eq(:bedroom)
    end

    it '2. Room #area' do
      expect(@room).to respond_to(:area).with(0).argument
      expect(@room.area).to eq(130)
    end

    it '3. Room #is_painted?' do
      expect(@room).to respond_to(:is_painted?).with(0).argument
      expect(@room.is_painted?).to eq(false)
    end

    it '4. Room #paint' do
      expect(@room).to respond_to(:paint).with(0).argument
      @room.paint
      expect(@room.is_painted?).to eq(true)
    end
  end

  describe '2 Iteration' do
    before :each do
      @house = House.new("$400000", "123 sugar lane")
      @room1 = Room.new(:bedroom, 10, '13')
      @room2 = Room.new(:bedroom, 11, '15')
    end

    it '5. House instantiation' do
      expect(House).to respond_to(:new).with(2).argument
      expect(@house).to be_an_instance_of(House)

      expect(@house).to respond_to(:address).with(0).argument
      expect(@house.address).to eq("123 sugar lane")

      expect(@house).to respond_to(:rooms).with(0).argument
      expect(@house.rooms).to eq([])
    end

    it '6. House #price' do
      expect(@house).to respond_to(:price).with(0).argument
      expect(@house.price).to eq(400000)
    end

    it '7. House #add_room' do
      expect(@house).to respond_to(:add_room).with(1).argument
      @house.add_room(@room1)
      @house.add_room(@room2)
      expect(@house.rooms).to eq([@room1, @room2])
    end
  end

  describe '3 Iteration' do
    before :each do
      @house1 = House.new("$400000", "123 sugar lane")
      @house2 = House.new("$800000", "123 sugar lane")
      @room_1 = Room.new(:bedroom, 10, '13')
      @room_2 = Room.new(:bedroom, 11, '15')
      @room_3 = Room.new(:living_room, 25, '15')
      @room_4 = Room.new(:basement, 30, '41')
      @house1.add_room(@room_1)
      @house1.add_room(@room_2)
      @house1.add_room(@room_3)
      @house1.add_room(@room_4)
    end

    it '8. House #above_market_average?' do
      expect(@house1).to respond_to(:above_market_average?).with(0).argument
      expect(@house1.above_market_average?).to eq(false)
      expect(@house2.above_market_average?).to eq(true)
    end

    it '9. House #rooms_from_category' do
      expect(@house1).to respond_to(:rooms_from_category).with(1).argument
      expect(@house1.rooms_from_category(:bedroom)).to eq([@room_1, @room_2])
      expect(@house1.rooms_from_category(:basement)).to eq([@room_4])
      expect(@house1.rooms_from_category(:great_room)).to eq([])
    end

    it '10. House #area' do
      expect(@house1).to respond_to(:area).with(0).argument
      expect(@house1.area).to eq(1900)
    end

    it '11. House #details' do
      expect(@house1).to respond_to(:details).with(0).argument
      expect(@house1.details).to eq({"price" => 400000, "address" => "123 sugar lane"})
    end
  end

  describe '4 Iteration' do
    before :each do
      @house = House.new("$400000", "123 sugar lane")
      @room_1 = Room.new(:bedroom, 10, '13')
      @room_2 = Room.new(:bedroom, 11, '15')
      @room_3 = Room.new(:living_room, 25, '15')
      @room_4 = Room.new(:basement, 30, '41')
      @house.add_room(@room_4)
      @house.add_room(@room_1)
      @house.add_room(@room_3)
      @house.add_room(@room_2)
    end

    it '12. House #price_per_square_foot' do
      expect(@house).to respond_to(:price_per_square_foot).with(0).argument
      expect(@house.price_per_square_foot).to eq(210.53)
    end

    it '13. House #rooms_sorted_by_area' do
      expect(@house).to respond_to(:rooms_sorted_by_area).with(0).argument
      expect(@house.rooms_sorted_by_area).to eq([@room_4, @room_3, @room_2, @room_1])
    end

    it '14. House #rooms_by_category' do
      expect(@house).to respond_to(:rooms_sorted_by_area).with(0).argument
      expected = {
        bedroom: [@room_1, @room_2],
        living_room: [@room_3],
        basement: [@room_4]
      }

      expect(@house.rooms_by_category).to eq(expected)
    end
  end
end
