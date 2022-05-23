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
    if @price > 500000
      true
    else
      false
    end
  end

  def rooms_from_category(category)
    @rooms.find_all do |room|
      room.category == category
    end
  end

  def area
    @rooms.sum { |room| + room.area}
  end

  def details
    {
      "price" => @price,
      "address" => @address
    }
  end

  def price_per_square_foot
    square_foot_price_rounded = @price / area.to_f
    square_foot_price_rounded.round(2)
  end
end
