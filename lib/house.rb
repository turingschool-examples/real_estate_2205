class House
  attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price[1..-1].to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    @price > 500000
  end

  def rooms_from_category(category_requested)
    @rooms.find_all do |room|
      room.category ==  category_requested
    end
  end

  def area
    @rooms.sum do |room|
      room.area
    end
  end

  def details
    {
      "price" => @price,
      "address" => @address
    }
  end

  def price_per_sqare_foot
    ppsq = sprintf "%.2f", @price/area.to_f
    ppsq.to_f
  end

  def rooms_sorted_by_area
    @rooms.sort_by do |room|
      -room.area
    end
  end

  def rooms_by_category
    rooms_hash = {}
    categories = []
    @rooms.each do |room|
      categories << room.category
    end
    categories.uniq!

    categories.each do |category|
      rooms_hash[category] = rooms_from_category(category)
    end

    rooms_hash
  end
end
