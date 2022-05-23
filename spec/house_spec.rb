require './lib/room'
require './lib/house'
require 'rspec'

RSpec.describe House do
  describe "Iteration 2" do

    it "exists" do
      house = House.new($300000, "123 Sugar Lane")
      expect(house).to be_a (House)
    end

    it "has rooms" do
      house = House.new($300000, "123 Sugar Lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')
      house.add_room(room_1)
      house.add_room(room_2)
      expect(house.rooms.length).to eq(2)
    end

    it "can check if under or over market value" do
      house = House.new("$300000", "123 Sugar Lane")
      house2 = House.new("600,000", "125 Badguy Lane")
      expect(house.above_market_average?).to be(false)
      expect(house2.above_market_average?).to be(true)
    end

    it "can check the rooms in a category" do
      house = House.new($300000, "123 Sugar Lane")
      bedroom_1 = Room.new(:bedroom, 10, '13')
      bedroom_2 = Room.new(:bedroom, 11, '15')
      house.add_room(bedroom_1)
      house.add_room(bedroom_2)
      expect(house.rooms_from_category(:bedroom)).to eq([bedroom_1, bedroom_2])
    end

    it "can return the total area of the house" do
      house = House.new($300000, "123 Sugar Lane")
      bedroom_1 = Room.new(:bedroom, 10, '13')
      bedroom_2 = Room.new(:bedroom, 11, '15')
      house.add_room(bedroom_1)
      house.add_room(bedroom_2)
      expect(house.area).to eq 295
    end

    it "can return the price per square foot" do
      house = House.new("$400,000", "123 Sugar Lane")
      bedroom_1 = Room.new(:bedroom, 10, '13')
      bedroom_2 = Room.new(:bedroom, 11, '15')
      house.add_room(bedroom_1)
      house.add_room(bedroom_2)
      expect(house.price_per_square_foot).to eq 1355
    end

    it "can return the rooms sorted by area" do
      house = House.new("$400,000", "123 Sugar Lane")
      room1 = Room.new(:bedroom, 10, "15")
      room2 = Room.new(:bedroom, 10, "16")
      house.add_room(room1)
      house.add_room(room2)
      expect(house.rooms_sorted_by_area).to eq [160, 150]
    end
  end
end
