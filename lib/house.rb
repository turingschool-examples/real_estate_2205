class House
  attr_reader :price, :address, :rooms
  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def add_room(new_room)
    @rooms << new_room
  end

  def above_market_average?
    if @price[1..-1].to_i > 500000
      true
    else
      false
    end
  end
end
