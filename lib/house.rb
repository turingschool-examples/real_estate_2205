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
    if @price.gsub("$","").to_i > 500000
      return true
    else
      return false
    end
  end

  def rooms_from_category(category)
    these_rooms = []
    @rooms.each do |room|
      if room.category == category
        these_rooms << room
      end
    end
    return these_rooms
  end

  def area
    total_area = 0
    @rooms.each do |room|
      total_area += room.area
    end
    return total_area
  end

  def details
    details = {
      "price" => @price.gsub("$","").to_i,
      "address" => @address
    }
    return details
  end

  def price_per_square_foot
    return (@price.gsub("$","").to_f / area).round(2)
  end

  def rooms_sorted_by_area
    these_rooms = Array.new()
    these_rooms << @rooms[0]
    @rooms.each do |room|
      #require 'pry'; binding.pry
      if room.area < these_rooms[0].area
        these_rooms << rooms
      elsif room.area > these_rooms[0].area
        these_rooms.prepend(room)
      else
        i = 0
        while these_rooms[i].area > room.area
          i +=1
        end
        these_rooms.insert(i)
      end
    end
    return these_rooms
  end

  def rooms_by_category
    categories = []
    these_rooms = Hash.new
    i = 0
    @rooms.each_with_index do |room, i|
      if !categories.include?(@rooms[i].category)
        categories << @rooms[i].category
      end
      i += 1
    end

    i = 0
    while i < categories.length
      these_rooms[categories[i]] = rooms_from_category(categories[i])
      i += 1
    end
    return these_rooms
  end
end
