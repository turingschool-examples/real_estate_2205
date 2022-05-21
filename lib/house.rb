require 'pry'

class House

  attr_reader :price, :address, :rooms, :area

  def initialize(price,address)
    @price = price[1..-1].to_i
    @address = address
    @rooms = []
    @area = 0
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

  def area
    total_area = 0

    @rooms.each do |room|
      total_area += room.area
    end

    @area = total_area
    total_area
  end

  def details
    details_hash = {
      "price" => @price,
      "address" => @address
    }
  end

  def price_per_square_foot
    (@price / self.area.to_f).round(2)
  end

end
