class House

  attr_reader :price, :address, :rooms

  def initialize(price,address)
    @price = price[1..-1].to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    @price > 500_000
  end

  def rooms_from_category(category)
    return_array = []

    @rooms.each do |room|
      if room.category == category
        return_array << room
      end
    end
    
    return_array
  end

end
