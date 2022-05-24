require './lib/house'
require './lib/room'

RSpec.describe House do
  describe "Iteration 2+3" do
    before :each do
      @house = House.new("400000", "123 sugar lane")
      @room_1 = Room.new(:bedroom, 10, '13')
      @room_2 = Room.new(:bedroom, 11, '15')
      @room_3 = Room.new(:living_room, 25, '15')
      @room_4 = Room.new(:basement, 30, '41')
      @house.add_room(@room_1)
      @house.add_room(@room_2)
      @house.add_room(@room_3)
      @house.add_room(@room_4)
    end

    it "exists" do
      expect(@house).to be_a House
    end

    it "it has a price" do
      expect(@house.price).to eq(400000)
    end

    it "it has an address" do
      expect(@house.address).to eq("123 sugar lane")
    end

    it "can add rooms" do
      expect(@house.rooms.empty?).to eq(false)
    end

    it "can have more than one room" do
      expect(@house.rooms.length).to eq(4)
    end

    it "returns T/F if the house is about market value" do
      expect(@house.above_market_average?).to eq(false)
    end

    xit "will list #rooms_from_category using symbol" do
      expect(@house.rooms_from_category(:bedroom)).to eq(2)
      # expect(@house.rooms_from_category(:basement)).to eq(1)
    end

    it "will calculate total area" do
      expect(@house.area).to eq(1900)
    end

    it "will return a hash of house attributes" do
      expect(@house.details).to eq([400000, "123 sugar lane"])
    end
  end
end
