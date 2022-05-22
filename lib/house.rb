class House

  attr_reader :price, :address, :rooms, :area, :details
  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    average_price = "$500000"
    @price > average_price
  end

  def rooms_from_category(category)
    rooms.select { |room| room.category == category }
  end

  def area
    rooms.map { |room| room.area }.reduce(:+)
  end

  def details
    detail = Hash.new(0)
    {"price" => @price.sub("$", "").to_i, "address" => @address}
  end

  def price_per_square_foot
    (@price.sub("$", "").to_f / area).round(2)

  end

end
