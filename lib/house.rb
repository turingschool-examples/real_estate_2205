class House
attr_reader :price, :address, :rooms
  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end
  def add_room(room)
    @rooms << room
  end
  def above_market_average?
    @price.to_i > 500000
  end
  def rooms_from_category(category)
    @rooms.select do |room|
      room.category == category
    end
  end
  def area
    @rooms.sum do |room|
    room.length * room.width.to_i
    end
  end

  def details
    house_details = {
    "price" => @price,
    "adderss" => @address
    }

  end
end
