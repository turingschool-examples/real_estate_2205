class House

  attr_reader :price, :address, :rooms, :area
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
end
