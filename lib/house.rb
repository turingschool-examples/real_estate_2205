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

  def above_market_average?
    if @price.to_i > 500000
      true
    else
      false
    end
  end

end
