class House
attr_reader :price, :address, :rooms
attr_accessor :rooms
  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def add_room(room_1)
    @rooms << room_1
  end

end
