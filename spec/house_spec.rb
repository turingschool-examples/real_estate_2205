require './lib/room'
require './lib/house'

RSpec.describe House do
  describe "Iteration 2" do
    it "exists and has price and address" do
      house = House.new("$400000", "123 sugar lane")

      expect(house).to be_a House
      expect(house.price).to eq("$400000")
      expect(house.address).to eq("123 sugar lane")
    end
    it "can add rooms" do
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')
      house.add_room(room_1)
      house.add_room(room_2)

      expect(house.rooms.length).to eq(2)
      expect(house.rooms[0]).to be_a Room
    end
  end
  describe "Iteration 3" do
    before :each do
      @house = House.new("$400000", "123 sugar lane")
      @room_1 = Room.new(:bedroom, 10, '13')
      @room_2 = Room.new(:bedroom, 11, '15')
      @room_3 = Room.new(:living_room, 25, '15')
      @room_4 = Room.new(:basement, 30, '41')
      @house.add_room(@room_1)
      @house.add_room(@room_2)
      @house.add_room(@room_3)
      @house.add_room(@room_4)
    end
    it "can say if it is above market average" do
      expect(@house.above_market_average?).to eq(false)
    end
    it "can lists rooms from category" do
      expect(@house.rooms_from_category(:bedroom).length).to eq(2)
      expect(@house.rooms_from_category(:basement).length).to eq(1)
      expect(@house.rooms_from_category(:basement)[0]).to be_a Room
    end
    it "can calculate house area from rooms" do
      expect(@house.area).to eq(1900)
    end
    it "can return house details" do
      expect(@house.details).to eq({"price" => 400000, "address" => "123 sugar lane"})
    end
  end
  describe "Iteration 4" do
    before :each do
      @house = House.new("$400000", "123 sugar lane")
      @room_1 = Room.new(:bedroom, 10, '13')
      @room_2 = Room.new(:bedroom, 11, '15')
      @room_3 = Room.new(:living_room, 25, '15')
      @room_4 = Room.new(:basement, 30, '41')
      @house.add_room(@room_1)
      @house.add_room(@room_2)
      @house.add_room(@room_3)
      @house.add_room(@room_4)
    end
    it "can return price per square foot" do
      expect(@house.price_per_square_foot).to eq(210.53)
    end
    it "can sort rooms by area great to small" do
      expect(@house.rooms_sorted_by_area[0].area).to eq(1230)
      expect(@house.rooms_sorted_by_area[3].area).to eq(130)
    end
    it "can return rooms by category in a hash" do
      expect(@house.rooms_by_category).to be_a Hash
      expect(@house.rooms_by_category.length).to eq(3)
    end
  end
end
