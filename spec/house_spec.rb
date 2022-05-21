require './lib/room'
require './lib/house'

RSpec.describe Room do
  let!(:room1) {Room.new(:bedroom, 10, '13')}
  let!(:room2) {Room.new(:living_room, 25, '15')}
  let!(:room3) {Room.new(:bedroom, 11, '15')}
  let!(:room4) {Room.new(:basement, 30, '41')}
  let!(:house) {House.new("$400000", "123 sugar lane")}

    describe "Iteration 2" do
      it "is an instance of" do
        expect(house).to be_instance_of(House)
      end

      it "has a price" do
        expect(house.price).to eq(400000)
      end

      it "has an address" do
        expect(house.address).to eq("123 sugar lane")
      end

      it "has rooms" do
        expect(house.rooms).to eq([])
      end

      it "can add a room to itself" do
        house.add_room(room1)
        house.add_room(room2)
        expect(house.rooms.length).to eq(2)
        expect(house.rooms).to include(Room)
      end
    end

    describe "Iteration 3" do
      it "can tell if the price is above market average" do
        expect(house.above_market_average?).to eq(false)
      end

      it "can list rooms from a category" do
        house.add_room(room1)
        house.add_room(room2)
        house.add_room(room3)
        house.add_room(room4)
        expect(house.rooms_from_category(:bedroom).count).to eq(2)
        expect(house.rooms_from_category(:basement).count).to eq(1)
      end

      it "can calculate house area" do
        house.add_room(room1)
        house.add_room(room2)
        house.add_room(room3)
        house.add_room(room4)
        expect(house.area).to eq(1900)
      end

      it "can list house details in hash" do
        expect(house.details).to eq({"price" => 400000, "address" => "123 sugar lane"})
      end
    end

    describe "Iteration 4" do
      it "can calculate price per square foot" do
        house.add_room(room1)
        house.add_room(room2)
        house.add_room(room3)
        house.add_room(room4)
        expect(house.price_per_square_foot).to eq(210.53)
      end

      it "can sort rooms by area" do
        house.add_room(room1)
        house.add_room(room2)
        house.add_room(room3)
        house.add_room(room4)
        expect(house.rooms_sorted_by_area).to eq([room4, room2, room3, room1])
      end

      it "return a collection of rooms gropued by room category" do
        house.add_room(room1)
        house.add_room(room2)
        house.add_room(room3)
        house.add_room(room4)
        expect(house.rooms_by_category).to eq({:bedroom=>[room1, room3], :living_room=> [room2], :basement=> [room4]})
      end
    end
  end
