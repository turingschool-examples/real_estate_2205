require './lib/room'

RSpec.describe Room do
  describe "Iteration 1" do
    before (:each) do
      @room = Room.new(:bedroom, 10, '13')

      @room1 = Room.new(:bedroom, 10, '13')
      @room2 = Room.new(:bedroom, 15, '12')
    end

    it "exists" do
      expect(@room).to be_a(Room)
    end

    it "it has a category" do
      expect(@room.category).to eq(:bedroom)
    end

    it "has area" do
      expect(@room1.area).to eq(130)
      expect(@room2.area).to eq(180)
    end

    it "hasn't been painted" do
      expect(@room.is_painted?).to eq(false)
    end

    it "has been painted" do
      @room.paint
      expect(@room.is_painted?).to eq(true)
    end

  end
end
