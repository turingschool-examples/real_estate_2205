require './lib/room'

RSpec.describe Room do
  describe "Iteration 1" do
    it "exists" do
      room = Room.new(:bedroom, 10, '13')
      expect(room).to be_a Room
    end

    xit "it has a category" do
      room = Room.new(:bedroom, 10, '13')

      expect(room.category).to eq(:bedroom)
    end

    xit "can get area" do
      room1 = Room.new(:bedroom, 10, '13')
      room2 = Room.new(:living_room, 15, '12')

      expect(room1.area).to eq(130)
      expect(room2.area).to eq(180)
    end
  end
end
