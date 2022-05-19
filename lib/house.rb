require './lib/room'

class House
attr_reader :price, :address, :rooms
attr_accessor :rooms
  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def add_room(room_1)
    @rooms << room_1
  end

  def above_market_average?
    if @price.to_i > 500000
      true
    else
      false
    end
  end

  def rooms_from_category(category)
    rooms_array = []

    @rooms.each do |room|
      if room.category == category
        rooms_array << room
      end
    end

    rooms_array
    ##HMMM???? look at potluck example?
  end

  def house_area
    total = room_1.area + room_2.area + room_3.area + room_4.area
    return total
  end

  def details
    house_hash = {
      "price" => house.price,
      "address" => house.address,
    }

    p house_hash
  end
end
