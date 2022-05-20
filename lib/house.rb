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
    # @price = price.to_i
    house = House.new("$400000", "123 sugar lane")

    house_hash = {
      "price" => house.price,
      "address" => house.address,
    }

    p house_hash
  end

#Bonus Iteration 4:
  def price_per_square_foot
    house = House.new("$400000", "123 sugar lane")
    #price as an integer
    y = house.price
    #house area
    y = y.delete("$")

    y = y.to_i
    x = house.house_area
    #divide integer price by house area
    z = y / x
    z = z.to_f
    #return 208.00


  end

  def rooms_sorted_by_area
    #rooms_array
    house = House.new("$400000", "123 sugar lane")

    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:living_room, 15, '12')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')
    rooms = [room_1, room_2, room_3, room_4]
    #each room instance from the rooms_array
    rooms = rooms.sort
    # rooms_area = rooms.map do |room|
    #   room.area
    return rooms

    end




    #sort in descending order greatest to least
    #some kind of enumerable method needed
    #possibly shoveling back in to rooms_array
    #unless I can do this using map
  end
