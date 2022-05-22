class House
  attr_reader :rooms
  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    if @price.to_i > 500000
      true
    else
      false
    end
  end

  def rooms_from_category(type)
    rooms_of_cat = []
    rooms.each do |room|
      if room.category == type
        rooms_of_cat << room
      end
    end
    rooms_of_cat
  end

  def area
    area = 0
    rooms.each do |room|
      area += room.area
    end
    area
  end

  def details
    details = {}
    details["price"] = @price.delete_prefix("$").to_i
    details["address"] = @address
    p details
  end

  def price_per_square_foot
    price = details["price"].to_f
    sq_foot = area.to_f
    ppsf = (price / sq_foot).round(2)
    p ppsf
  end

  #unsure where to start with this method.
  def rooms_sorted_by_area
    big_to_small = []
    rooms.each do |room|
    end
    big_to_small
  end

  def rooms_by_category
    room_hash = {}
    room_array = []
    rooms.each do |room|
      if room_hash.key?(room.category)
        room_hash[room.category] = room_array << room
      end
    end
    room_hash
  end
end
