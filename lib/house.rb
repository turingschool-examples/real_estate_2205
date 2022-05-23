class House

  attr_reader :price, :address, :rooms
  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []


  end

  def add_room(room)
      @rooms << room
  end

  def above_market_average?

      @price < "500000"
      false

  end

  def rooms_from_category(category)

    house_rooms = []
    @rooms.each do |room|
      if room.category == category
          house_rooms << room
      end
    end
    house_rooms 
  end



end
