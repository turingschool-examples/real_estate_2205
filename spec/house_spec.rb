require './lib/room'
require './lib/house'

RSpec.describe House do
  it 'exists' do
    house = House.new("$400000", "123 sugar lane")
    expect(house).to be_a(House)
  end

  it 'has attributes' do
    house = House.new("$400000", "123 sugar lane")
    expect(house.price).to eq(400000)
    expect(house.address).to eq("123 sugar lane")
    expect(house.rooms).to eq([])
  end

  it 'can add different rooms' do
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    house.add_room(room_1)
    house.add_room(room_2)
    expect(house.rooms).to eq([room_1, room_2])
  end

  it 'can check if its price is above market average' do
    house = House.new("$400000", "123 sugar lane")
    expect(house.above_market_average?).to eq(false)
  end

  it 'can list its rooms by category' do
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
    expect(house.rooms_from_category(:basement)).to eq([room_4])
    expect(house.rooms_from_category(:living_room)).to eq([room_3])
  end

  it 'can return sum of all rooms areas' do
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

    room_5 = Room.new(:basement, 20, '30')
    house.add_room(room_5)
    expect(house.area).to eq(2500)
  end

  it 'can return house details hash' do
    house = House.new("$400000", "123 sugar lane")
    expected = {"price" => 400000, "address" => "123 sugar lane"}
    expect(house.details).to eq(expected)
  end

  it 'can calculate the price per square foot' do
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')
    house.add_room(room_4)
    house.add_room(room_1)
    house.add_room(room_3)
    house.add_room(room_2)
    expect(house.price_per_square_foot).to eq(210.53)
  end
end
