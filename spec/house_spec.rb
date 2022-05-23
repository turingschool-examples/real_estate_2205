require './lib/house'

RSpec.describe House do
  describe "Iteration 2" do
    it "exists" do
      house = House.new(price, address)
      expect(house).to be_a House
    end

    xit "it has a price" do
      house = House.new(price, address)
      expect(house.price).to eq("400000")
    end

    xit "it has an address" do
      house = House.new(price, address)
      expect(house.address).to eq("123 sugar lane")
    end
    xit "it has a rooms array" do
      house = House.new(price, address)
      expect(house.rooms).to eq([])
    end
    xit "can add rooms" do
      house = House.new(price, address)
      room_1 = Room.new(:bedroom, 10, '13')
      house.add_room(room_1)
      expect(house.rooms).to eq([]) #list current rooms, might need to set eq to something more specific
    end
  end
end
