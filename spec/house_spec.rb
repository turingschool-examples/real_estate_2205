require './lib/room'
require './lib/house'

RSpec.describe House do
  let(:house) {House.new("$400000", "123 sugar lane")}
  let(:room1) {Room.new(:bedroom, 10, '13')}
  let(:room2) {Room.new(:bedroom, 11, '15')}
  let(:room3) {Room.new(:living_room, 25, '15')}
  let(:room4) {Room.new(:basement, 30, '41')}

  it "exists" do
    expect(house).to be_an(House)
  end

  it "has attributes" do
    expect(house.price).to eq("$400000")
    expect(house.address).to eq("123 sugar lane")
    expect(house.rooms).to eq([])
  end

  it "can add rooms" do
    expect(house.rooms).to eq([])
    house.add_rooms(room1)
    expect(house.rooms).to eq([room1])
    house.add_rooms(room2)
    expect(house.rooms).to eq([room1, room2])
  end

  it "can see a house price ABOVE market average" do
    expect(house.above_market_average?).to eq(false)
  end

  it "can list rooms by category" do
    expect(house.rooms).to eq([])
    house.add_rooms(room1)
    house.add_rooms(room2)
    house.add_rooms(room3)
    house.add_rooms(room4)
    expect(house.rooms).to eq([room1, room2, room3, room4])
    expect(house.rooms_from_category(:bedroom)).to eq([room1, room2])
    expect(house.rooms_from_category(:basement)).to eq([room4])
  end

  it "can check the area of the entire house" do
    expect(house.rooms).to eq([])
    house.add_rooms(room1)
    house.add_rooms(room2)
    expect(house.rooms).to eq([room1, room2])
    expect(house.area).to eq(295)
    house.add_rooms(room3)
    house.add_rooms(room4)
    expect(house.rooms).to eq([room1, room2, room3, room4])
    expect(house.area).to eq(1900)
  end

  it "can return house details as a hash" do
    expect(house.house_details).to eq(
      {"price" => 400000,
       "address" => "123 sugar lane"}
    )
  end

  it "can check the price per square foot" do
    expect(house.rooms).to eq([])
    house.add_rooms(room1)
    house.add_rooms(room2)
    house.add_rooms(room3)
    house.add_rooms(room4)
    expect(house.rooms).to eq([room1, room2, room3, room4])
    expect(house.price_per_square_foot).to eq(210.53)
  end

  it "can sort the rooms by area from greatest to least" do
    expect(house.rooms).to eq([])
    house.add_rooms(room1)
    house.add_rooms(room2)
    house.add_rooms(room3)
    house.add_rooms(room4)
    expect(house.rooms).to eq([room1, room2, room3, room4])
    expect(house.rooms_sorted_by_area).to eq([room4, room3, room2, room1])
  end

  it "can make a hash with category as the key and the room instance as the value" do
    expect(house.rooms).to eq([])
    house.add_rooms(room1)
    house.add_rooms(room2)
    house.add_rooms(room3)
    house.add_rooms(room4)
    expect(house.rooms).to eq([room1, room2, room3, room4])
    expect(house.rooms_by_category).to eq({
      :bedroom => [room1, room2],
      :living_room => [room3],
      :basement => [room4]
      })
  end
end
