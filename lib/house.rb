class House
  attr_reader :price, :address, :rooms, :area
  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
    @area = 0
  end

  def add_room(new_room)
    @rooms << new_room
    @area += new_room.area
  end

  def above_market_average?
    if @price[1..-1].to_i > 500000
      true
    else
      false
    end
  end

  def rooms_from_category(room_type)
    rooms_to_return = []
    rooms_not_to_return = []

    @rooms.each do |room|
      if room.category == room_type
        rooms_to_return << room
      elsif
      rooms_not_to_return << room
      end
    end
    rooms_to_return
  end
end
