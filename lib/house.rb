class House
  attr_reader :price,
              :address,
              :rooms
  def initialize(price, address)
    @price = price.delete("$").to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    @price > 5000000
  end

  def rooms_from_category(category)
    @rooms.find_all {|room| room.category == category}
  end

  def area
    @rooms.sum {|room| room.area}
  end

  def details
    {
      "price" => @price,
      "address" => @address
    }
  end
end
