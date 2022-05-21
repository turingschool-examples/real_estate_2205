class House

  attr_reader :price,
              :address,
              :rooms

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def add_rooms(room)
    @rooms << room
  end

  def above_market_average?
    market_price = @price.delete("$").to_i
    market_price > 500000
  end

  def rooms_from_category(category)
    @rooms.select {|room| room.category == category}
  end

  def area
    @rooms.sum {|room| room.area}
  end

  def house_details
   house_hash = Hash.new
   house_hash["price"] = @price.delete("$").to_i
   house_hash["address"] = @address
   return house_hash
  end

  def price_per_square_foot
    house_price = @price.delete("$").to_i
    area = @rooms.sum {|room| room.area}
    (house_price / area.to_f).round(2)
  end

  def rooms_sorted_by_area
    @rooms.sort_by {|room| room.area}.reverse
  end

  def rooms_by_category
    @rooms.group_by {|room| room.category}
  end
end
