require './lib/room'

RSpec.describe Room do
  let!(:room1) {Room.new(:bedroom, 10, '13')}
  let!(:room2) {Room.new(:living_room, 15, '12')}

  describe "Iteration 1" do
    it "exists" do
      expect(room1).to be_a Room
    end

    it "it has a category" do
        expect(room1.category).to eq(:bedroom)
    end

    it "can get area" do
      expect(room1.area).to eq(130)
      expect(room2.area).to eq(180)
    end

    it "can tell if it is painted or not" do
      expect(room1.is_painted?).to eq(false)
    end

    it "can be painted" do
      room1.paint
      expect(room1.is_painted?).to eq(true)
    end
  end
end
