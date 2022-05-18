require './lib/room'

class House

  attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price.delete("$").to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    return true if @price > 500000
    return false
  end

  def rooms_from_category(category)
    category_rooms = []
    @rooms.each do |room|
      if room.category == category
        category_rooms << room
      end
    end
    return category_rooms
  end

  def area
    house_area = 0
    @rooms.each do |room|
      house_area += room.area
    end
    return house_area
  end

  def details
    house_hash = {"price" => @price, "address" => @address}
  end

  def price_per_square_foot
    return (@price.to_f / area.to_f).round(2)
  end

  def rooms_sorted_by_area

  end

  def rooms_by_category
    rooms_by_category = Hash.new
    room_categories = []
    @rooms.each do |room|
      room_categories << room.category
    end
    room_categories.uniq!
    room_categories.each do |category|
      rooms_by_category[category] = rooms_from_category(category)
    end
    return rooms_by_category
  end

end
