class House
  attr_reader :price, :address, :rooms
  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def add_rooms(the_room)
    @rooms << the_room
  end

  def above_market_average?
    if @price.gsub(/\D/, '').to_i <= 500000
      false
    else
      @price.gsub(/\D/, '').to_i > 500000
      true
    end
  end

end
