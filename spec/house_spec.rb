require './lib/room'
require './lib/house'

RSpec.describe House do

  before :each do
  @house = House.new("$400000", "123 sugar lane")
  @room_1 = Room.new(:bedroom, 10, '13')
  @room_2 = Room.new(:bedroom, 11, '15')
  @room_3 = Room.new(:living_room, 25, '15')
  @room_4 = Room.new(:basement, 30, '41')
  end

  it 'exists' do

  expect(@house).to be_a(House)

  end

  it 'can have multiple rooms' do
  @room_1 = Room.new(:bedroom, 10, '13')
  @room_2 = Room.new(:bedroom, 11, '15')
  @house.add_room(@room_1)
  @house.add_room(@room_2)
  expect(@house.rooms).to eq([@room_1, @room_2])

  end

  it 'can have a price above or below market average' do

  expect(@house.above_market_average?).to be(false)

  end

  it 'can list its rooms by category' do
  @room_3 = Room.new(:living_room, 25, '15')
  @room_4 = Room.new(:basement, 30, '41')
  @house.add_room(@room_1)
  @house.add_room(@room_2)
  @house.add_room(@room_3)
  @house.add_room(@room_4)

  expect(@house.rooms_from_category(:bedroom)).to eq([@room_1, @room_2])
  expect(@house.rooms_from_category(:basement)).to eq([@room_4])

  end

  it 'has a total square footage' do
  @house.add_room(@room_1)
  @house.add_room(@room_2)
  @house.add_room(@room_3)
  @house.add_room(@room_4)
  @house_area = [@room_1.area, @room_2.area, @room_3.area, @room_4.area]

  expect(@house.area).to eq(1900)
  end

  it 'has a hash with details on its attributes' do

  expect(@house.details).to eq({"price" => 400000, "address" => "123 sugar lane"})
  
  end

end
