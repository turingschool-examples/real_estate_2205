require './lib/room'

RSpec.describe Room do
  describe "Iteration 1" do
    before :each do
      @room = Room.new(:bedroom, 10, '13')
      @room1 = @room
      @room2 = Room.new(:living_room, 15, '12')
    end

    it "exists" do
      expect(@room).to be_a Room
    end

    it "it has a category" do
      expect(@room.category).to eq(:bedroom)
    end

    it "can get area" do
      expect(@room1.area).to eq(130)
      expect(@room2.area).to eq(180)
    end

    it 'can tell if room is painted, and can change status' do
      expect(@room1.painted?).to be(false)
      expect(@room2.painted?).to be(false)

      @room1.paint

      expect(@room1.painted?).to be(true)
      expect(@room2.painted?).to be(false)
    end

  end
end
