require './lib/room'
require './lib/house'

RSpec.describe House do
  let(:house) { House.new("$400000", "123 sugar lane") }
  let(:room_1) { Room.new(:bedroom, 10, '13') }
  let(:room_2) { Room.new(:bedroom, 11, '15') }
  let(:room_3) { Room.new(:living_room, 25, '15') }
  let(:room_4) { Room.new(:basement, 30, '41') }

  it "exists" do
    expect(house).to be_a(House)
  end

  it "has attributes" do
    expect(house.price).to eq(400000)
    expect(house.address).to eq("123 sugar lane")
    expect(house.rooms).to eq([])
  end

  it "can check that the house has rooms" do
    house.add_room(room_1)
    house.add_room(room_2)

    expect(house.rooms).to eq([room_1, room_2])
  end

  it "can tell if a house is above market average" do
    expect(house.above_market_average?).to eq false
  end

  it "can list all rooms in the house by category" do
    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    expect(house.rooms_from_category(:bedroom)).to eq([room_1, room_2])
    expect(house.rooms_from_category(:basement)).to eq([room_4])
  end

  it "can calucluate the area of the home by adding the areas of all the rooms" do
    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    expect(house.area).to eq(1900)
  end

  it "can return a hash of a house's attributes" do
    expect(house.details).to eq({"price" => 400000, "address" => "123 sugar lane"})
  end

  it "can calculate the price per square foot of a home" do
    house.add_room(room_4)
    house.add_room(room_1)
    house.add_room(room_3)
    house.add_room(room_2)

    expect(house.price_per_square_foot).to eq (210.53)
  end

  it "can return rooms sorted by greatest to least area" do
    house.add_room(room_4)
    house.add_room(room_1)
    house.add_room(room_3)
    house.add_room(room_2)

    expect(house.rooms_sorted_by_area).to eq([room_4, room_3, room_2, room_1])
  end

  it "can return a hash of each room by category" do
    house.add_room(room_4)
    house.add_room(room_1)
    house.add_room(room_3)
    house.add_room(room_2)

    expected = {
      :bedroom => [room_1, room_2],
      :living_room => [room_3],
      :basement => [room_4]
    }

    expect(house.rooms_by_category).to eq(expected)
  end
end
