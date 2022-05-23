require './lib/room'
require './lib/house'


RSpec.describe House do
  it ' exists' do
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

  it 'has rooms' do
    house = House.new("$400000", "123 sugar lane")

    expect(house.rooms).to eq([])
  end

  it ' has added rooms' do
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    house.add_room(room_1)
    house.add_room(room_2)
    expect(house.rooms).to eq([room_1, room_2])
  end

  it 'is above market average?' do
    house = House.new("$400000", "123 sugar lane")

    expect(house.above_market_average?).to be false

  end

  it 'rooms from category' do
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')
    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    expect(house.rooms_from_category(:bedroom)).to eq ([room_1,room_2, room_3, room_4])
  end


end
