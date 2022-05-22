class House
  attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price[1..-1].to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    @price > 500000
  end

  def rooms_from_category(category_requested)
    @rooms.find_all do |room|
      room.category ==  category_requested
    end
  end

  def area
    @rooms.sum do |room|
      room.area
    end
  end

  def details
    {
      "price" => @price,
      "address" => @address
    }
  end
end
