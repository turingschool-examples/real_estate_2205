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
    @price[1 .. -1].to_i > 500000
  end

  def rooms_from_category(category)
    @rooms.find_all do |room|
      room.category == category
    end
  end

  def area
    area = 0
    rooms.each do |room|
      area += room.area
    end
    return area
  end

  def details
    deets = {"price" => @price[1 .. -1].to_i, "address" => @address}
  end

  def price_per_square_foot
    (@price[1 .. -1].to_f / area).round(2)
  end

  def rooms_sorted_by_area
    sorted_rooms = @rooms.sort_by do |room|
      room.area
    end
    return sorted_rooms.reverse
  end
end
