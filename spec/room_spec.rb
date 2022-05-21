require './lib/room'

RSpec.describe Room do
  describe "Iteration 1" do
    it "exists" do
      room = Room.new(:bedroom, 10, '13')
      expect(room).to be_a Room
    end

    it "it has a category" do
      room = Room.new(:bedroom, 10, '13')

      expect(room.category).to eq(:bedroom)
    end

    it "can get area" do
      room1 = Room.new(:bedroom, 10, '13')
      room2 = Room.new(:living_room, 15, '12')

      expect(room1.area).to eq(130)
      expect(room2.area).to eq(180)
    end

    it "is the room painted? (should not)" do
      room1 = Room.new(:bedroom, 10, '13')
      room2 = Room.new(:living_room, 15, '12')
      expect(room1.is_painted?).to eq(false)
      expect(room2.is_painted?).to eq(false)
    end

    it "is room painted (yes)" do
      room1 = Room.new(:bedroom, 10, '13')
      room2 = Room.new(:living_room, 15, '12')
      room1.paint
      room2.paint
      expect(room1.is_painted?).to eq(true)
      expect(room2.is_painted?).to eq(true)
    end
  end
end
