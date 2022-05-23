class House

  attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price.delete("$").to_i
    @address = address
    @rooms = []

  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    if @price > 500000
      return true
    else
      false
    end
  end

  def rooms_from_category(category)
    room_categories = []
    @rooms.each do |room|
      if room.category == category
        room_categories << room
      end
    end
    room_categories
  end




end
