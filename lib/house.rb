class House
attr_reader :price, :address, :rooms
  def initialize(price, address, rooms)
    @price = "400000"
    @address = "123 sugar lane"
    @rooms =[]
  end

  # def price
  #   @price = "400000"
  # end
  #
  # def address
  #   @address = "123 sugar lane"
  # end

  # def rooms
  #   @rooms =[]
  # end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    if price > "500000"
      return true
  end

  def rooms_from_category

  end

  def area
    @rooms.each do |room|
      area.room_1 += area.room_2
  end

  def details
    @details = {
      price => address
    }
  end
end
