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

  end

end
