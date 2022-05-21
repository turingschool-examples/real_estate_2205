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

  def rooms_sorted_by_area
    sorted_rooms = @rooms.sort_by {|room| room.area}
    sorted_rooms.reverse!
    sorted_rooms
  end

  def rooms_by_category
    return_hash = Hash.new
    unique_categories = []

    @rooms.each do |room|
      unique_categories << room.category
    end

    unique_categories.uniq!

    unique_categories.each do |category|
      value_array = []
      @rooms.each do |room|
        if room.category == category
          value_array << room
        end
      end
      return_hash[category] = value_array
    end

    return_hash
  end

end
