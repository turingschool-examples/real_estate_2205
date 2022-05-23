class House

  attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price
    @address = address
    @rooms =[]
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    @price[1..-1].to_i > 500000
  end

  def rooms_from_category(category)
    @rooms.find_all do |room|
      room.category == category
    end
  end

  def area
    area = 0
    @rooms.each do |room|
      area += room.area
    end
    area
  end

  def details
    details = {}
    details["price"] = @price[1..-1].to_i
    details["address"] = @address
    details
  end

  def price_per_square_foot
    (@price[1..-1].to_f / area.to_f).round(2)
  end
  def rooms_sorted_by_area
    @rooms.sort_by {|room| room.area}.reverse
  end

  def rooms_by_category
    @rooms.sort_by {|room| room.category}
  end

  def rooms_by_category
    room_list = {}
    @rooms.uniq {|room| room.category}.map {|room| room.category}.each do |category|
      room_list[category] = rooms_from_category(category)
    end
    room_list
  end


end
