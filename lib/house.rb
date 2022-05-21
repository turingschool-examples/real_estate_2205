class House
  attr_reader :price,
              :address,
              :rooms

  def initialize(price, address)
    @price = price.delete_prefix("$").to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    @price > 500000 ? true : false
  end

  def rooms_from_category(category)
    @rooms.select {|room| room.category == (category)}
  end

  def area
    @rooms.sum {|room| room.area}
  end

  def details
    details = {"price" => @price, "address" => @address}
    details
  end
end
