require './lib/room'
require './lib/house'
require 'pry'
require 'rspec'

RSpec.describe House do
  it "house exist" do
    house = House.new("$400000", "123 sugar lane")
    expect(house).to be_a(House)
  end

  it "has rooms" do
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    house.add_rooms(room_1)
    house.add_rooms(room_1)

    expect(house.add_rooms(room_1)).to eq (house.rooms)
  end

  it "is house above market (above 500k) be false" do
    house = House.new("$400000", "123 sugar lane")
    expect(house.above_market_average?).to eq(false)
  end

  it "is house above 500k be true" do
    house = House.new("$600001", "123 sugar lane")
    expect(house.above_market_average?).to eq(true)
  end

  it "list rooms from category" do
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')
    house.add_rooms(room_1)
    house.add_rooms(room_2)
    house.add_rooms(room_3)
    house.add_rooms(room_4)
    expect(house.rooms_from_category(:bedroom)).to eq([room_1, room_2])
  end

  xit "calculates total house area by combining room area" do
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')
    house.add_rooms(room_1)
    house.add_rooms(room_2)
    house.add_rooms(room_3)
    house.add_rooms(room_4)
    expect(house.area).to eq(1900)

  end
end
