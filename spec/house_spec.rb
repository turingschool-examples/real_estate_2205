require './lib/room'
require './lib/house'

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
end
