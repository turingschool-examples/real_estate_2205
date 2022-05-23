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
    @price.to_i > 5000000
  end
#time is up, could not figure out this method in time
  def rooms_from_category(category)
    @rooms.find_all do |room|
      @room == category
    end
  end

end
