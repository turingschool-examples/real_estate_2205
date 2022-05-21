require './lib/room'
require './lib/house'

RSpec.describe Room do
  let!(:room1) {Room.new(:bedroom, 10, '13')}
  let!(:room2) {Room.new(:living_room, 15, '12')}
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
  end
