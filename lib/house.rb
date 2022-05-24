class House
  attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price.to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    if @price > 500000
      true
    else
      false
    end
  end

  def rooms_from_category(search_category)
    cat_search = []
    @rooms.each do |room|
      if room.category == search_category
        cat_search << room
      end
    end
  end

  def area
    total = 0
    @rooms.each do |room|
      total += room.area
    end
    total
  end

  def details
    holder = [@price, @address]
  end
end
