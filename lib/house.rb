class House
  attr_reader :price, :address, :rooms
  def initialize(price, address)
    @price = price[1..-1].to_i
    @address = address
    @rooms = []
    @above_market_avg = true
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    if @price > 500000
      @above_market_avg
    elsif @price <= 500000
      !@above_market_avg
    end
  end

  def rooms_from_category(category)
    @rooms.find_all do |room|
      room.category == category
    end
  end

  def area
    @rooms.sum do |room|
      room.area
    end
  end

  def details
    house_details = Hash.new
    house_details["address"] = @address
    house_details["price"] = @price
    return house_details
  end

  def price_per_square_foot
    (price.to_f / area).round(2)
  end

  def rooms_sorted_by_area
    @rooms.select do |room|
      room.area
    end
  end

  def rooms_by_category
    @rooms.group_by do |room|
      room.category
    end

  end
end
