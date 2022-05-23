class House
  attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price.to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end
end
