require './lib/room'
require './lib/house'
require 'pry'

RSpec.describe House do

  it 'can return elements of house' do
    house = House.new("$400000", "123 sugar lane")

    expect(house.price).to eq(400000)
    expect(house.address).to eq("123 sugar lane")
    expect(house.rooms).to eq([])
  end

  it 'can add rooms to house' do
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')

    house.add_room(room_1)
    house.add_room(room_2)
    house.rooms
  end

  # Itteration 3

  it 'can compare house price to market price' do
    house = House.new("$400000", "123 sugar lane")
    expect(house.above_market_average?).to eq(false)
  end

  it 'can add rooms to house, find total are and return details' do
    house = House.new("$400000", "123 sugar lane")

    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')

    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    house.rooms_from_category(:bedroom)
    house.rooms_from_category(:basement)

    expect(house.area).to eq(1900)

    expect(house.details).to eq({"price" => 400000, "address" => "123 sugar lane"})

  end

  end
