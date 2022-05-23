require './lib/room'
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
    @price_int = @price.scan(/[.0-9]/).join().to_i
    if @price_int > 500000
      return true
    else
      return false
    end
  end

  def rooms_from_category(category)
     @rooms.select do |room|
       room.category == category
     end
  end

  def area
    @total_area = 0
    total_area_sum = 0
    rooms.select do |room|
      total_area_sum += room.area
    end
    @total_area += total_area_sum
    return @total_area
  end

  def details
    house_hash = Hash.new("house_hash")
    house_hash = {"address" => @address, "price" => @price}
    return house_hash
  end

  def price_per_square_foot
    @price_int = @price.scan(/[.0-9]/).join().to_i
    ppsf = @price_int / area
    return ppsf
  end

  def rooms_sorted_by_area
    room_area_array = []
    rooms.select do |room|
      room_area_array << room.area
    end
    return room_area_array.sort.reverse
  end
#Ran out of time here...
  # def rooms_by_category
  #   rooms_by_category_hash = Hash.new
  #   @rooms.select do |room|
  #     rooms_by_category_hash[category] = room.category
  # end

end
