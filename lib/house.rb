require './lib/room'
class House
  attr_reader :address, :rooms

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
    @area = area

  end

  def price
    @price.slice!(0)
    @price.to_i
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    price > 500000
  end

  def rooms_from_category(category)
    rooms_array = []
    @rooms.each do |room|
      if room.category == category
        rooms_array << room
      end
    end
    rooms_array
  end

  def area
    @rooms.each do |room|
      room.area.sum
    end
  end

end
