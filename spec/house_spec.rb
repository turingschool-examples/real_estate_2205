require './lib/room'
require './lib/house'

RSpec.describe House do
  describe "Iteration 2" do
    it "exists" do
      house = House.new("$400000", "123 sugar lane")
      expect(house).to be_a House
    end
  end

  it "has rooms" do
    house = House.new("$400000", "123 sugar lane")
    expect(house.rooms).to eq([])
  end

  it "can have additional rooms" do
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    house.add_room(room_1)
    house.add_room(room_2)
    expect(house.rooms).to eq([room_1, room_2])
  end

  it "checks above or below market average" do
    house = House.new("$400000", "123 sugar lane")
    expect(house.above_market_average?).to eq(false)
    house2 = House.new("$600000", "456 sugar lane")
    expect(house2.above_market_average?).to eq(true)
  end

  it "can list rooms by category" do
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
  end

  it "can calculate area after adding multiple rooms" do
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
  end

  it "has a hash of house details" do
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')
    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)
    expect(house.details).to eq({"price" => 400000, "address" => "123 sugar lane"})
  end

  it "calculates its price per square foot" do
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

  # did not complete the below tests' method
  # it "returns a list of rooms sorted by area" do
  #   house = House.new("$400000", "123 sugar lane")
  #   room_1 = Room.new(:bedroom, 10, '13')
  #   room_2 = Room.new(:bedroom, 11, '15')
  #   room_3 = Room.new(:living_room, 25, '15')
  #   room_4 = Room.new(:basement, 30, '41')
  #   house.add_room(room_4)
  #   house.add_room(room_1)
  #   house.add_room(room_3)
  #   house.add_room(room_2)
  #   expect(house.rooms_sorted_by_area).to eq([room_4, room_3, room_2, room_1])
  # end


end
