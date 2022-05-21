require './lib/room'
require './lib/house'

RSpec.describe House do
  before do
    @house = House.new("$400000", "123 sugar lane")
    @room_1 = Room.new(:bedroom, 10, '13')
    @room_2 = Room.new(:bedroom, 11, '15')
    @room_3 = Room.new(:living_room, 25, '15')
    @room_4 = Room.new(:basement, 30, '41')
  end

  it "exists" do
    expect(@house).to be_a(House)
  end

  it "has an array of rooms to default empty" do
      expect(@house.rooms).to eq([])
  end

  it "has rooms" do
    @room_3 = Room.new(:living_room, 25, '15')
    @room_4 = Room.new(:basement, 30, '41')

    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    expect(@house.rooms).to eq([@room_1, @room_2, @room_3, @room_4])
  end

  it "defines above_market_average" do
    expect(@house.above_market_average?).to eq(false)
  end

  it "returns all rooms from category" do
    expect(@house.rooms_from_category(:bedroom)).to eq([])
    expect(@house.rooms_from_category(:basement)).to eq([])
  end

  it "has area" do
    expect(@house.area).to eq(1900)
  end

  it "has details" do
    expect(@house.details).to eq({"price" => 400000, "address" => "123 sugar lane"})
  end

end
