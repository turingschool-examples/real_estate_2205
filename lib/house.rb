class House
  attr_accessor :price,
                :address,
                :rooms

  def initialize(price_string, address)
    @price = price_string.gsub("$", "").to_i #this might be breaking law
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    @price > 500000
  end

  def rooms_from_category(category)
    list_of_rooms = []
    @rooms.each do |room|
      list_of_rooms << room if room.category == category
    end
    return list_of_rooms
  end
end
