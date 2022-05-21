class House
  attr_reader :address, :rooms

  def initialize(cost, address)
    @cost = cost
    @address = address
    @rooms = []
  end

  def price
    @cost.delete("$").to_i
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    if @cost.delete("$").to_i > 500000
      true
    else
      false
    end
  end

  def rooms_from_category(category)
    rooms_in_category = []
    @rooms.each do |room|
      if room.category == category
        rooms_in_category << room
      end
    end
    rooms_in_category
  end

  def area
    total_area = 0
    @rooms.each do |room|
      total_area += room.area
    end
    total_area
  end

  def details
    detail_hash = {}
    detail_hash["price"] = price
    detail_hash["address"] = @address
    detail_hash
  end

  def price_per_square_foot
    final = price.to_f / area.to_f
    final.ceil(2)
  end

  def rooms_sorted_by_area
    sorted = @rooms.sort_by do |room|
      room.area
    end
    sorted
  end

  def rooms_by_category
    category_hash = {}
    @rooms.each do |room|
      category_hash[room.category] = []
    end
    @rooms.each do |room|
      category_hash[room.category] << room
    end
    category_hash
  end


end
