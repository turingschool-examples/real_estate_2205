class House
  attr_reader :price, :address, :rooms
  def initialize(price, address)
    @price = price[1..-1].to_i
    @address = address
    @rooms = []
    @above_market_avg = true
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    if @price > 500000
      @above_market_avg
    elsif @price <= 500000
      !@above_market_avg
    end
  end
end
