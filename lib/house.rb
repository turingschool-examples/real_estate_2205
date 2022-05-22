class House
attr_reader :price,
            :address,
            :rooms,
            :details
  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
    @details = {
      "price" => 400000,
      "address" => "123 sugar lane"
    }
  end

  def add_room(new_room)
    @rooms << new_room
  end

  def above_market_average
    @price.to_i > 500000

  end

  def rooms_from_category(category)
    @rooms.find_all do |room|
      room.category == category
    end
  end

  def area
    @rooms.sum do |room|
      room.area
    end
  end

end
