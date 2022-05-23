class House
  attr_reader :price_string, :address, :price, :rooms; :house

  def initialize(price_string, address)
    @price_string = price_string
    @price = price_string.delete("$").to_i
    @address = address
    @rooms = []

  end

  def add_room(room)
    rooms << room
  end

  def above_market_average?
    if price > 500000
      true
    elsif price <= 500000
      false
    end
  end

    def rooms_from_category(room_category)
      rooms.select{|room| room.category == room_category}
    end



end
