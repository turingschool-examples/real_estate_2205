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
  end

  def house_area
    def area
      @length = length
      @width = width.to_i
      return @length * @width
    end
    room_1= Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:living_room, 15, '12')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')
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
