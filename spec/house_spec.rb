require "./lib/room"
require "./lib/house"


RSpec.describe(House) do
  describe("Iteration2") do
    it("#exists") do
      house = House.new("$400000", "123 sugar lane")
      expect(house).to(be_a(House))
    end
  end

  house = House.new("$400000", "123 sugar lane")

  it("#has a price") do
    expect(house.price).to(eq("$400000"))
  end

  house = House.new("$400000", "123 sugar lane")

  it("#has an address") do
    expect(house.address).to(eq("123 sugar lane"))
  end

  house = House.new("$400000", "123 sugar lane")
  room_1 = Room.new(:bedroom, 10, "13")
  room_2 = Room.new(:bedroom, 11, "15")

  xit(" #has an empty rooms array") do
    expect(house.rooms).to(eq([]))
  end

  house = House.new("$400000", "123 sugar lane")
  room_1 = Room.new(:bedroom, 10, "13")
  room_2 = Room.new(:bedroom, 11, "15")
  house.add_room(room_1)
  house.add_room(room_2)

  it(" #can shovel these 2 bedrooms into the rooms array") do
    expect(house.rooms).to(eq([room_1, room_2]))
  end
end
