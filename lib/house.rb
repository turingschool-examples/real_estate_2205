class House

  attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price.delete!("$").to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    if price > 500000
      true
    else
      false
    end
  end

  def rooms_from_category(category)
    rooms_in_category = []
    rooms.each do |room|
      if category == room.category
        rooms_in_category << room
      end
    end
    rooms_in_category
  end

  def area
    rooms_sum = 0
    rooms.each do |room|
      rooms_sum += room.area
    end
    rooms_sum
  end

  def details
    details = {"price" => @price, "address" => @address}
  end
end
