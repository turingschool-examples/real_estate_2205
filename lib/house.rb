class House
  attr_reader :amount, :address, :rooms

  def initialize(amount, address)
    @amount = amount
    @address = address
    @rooms = []
  end

  def price
    @amount = @amount.delete("$").to_i
  end

  def add_room(x)
    @rooms << x
  end

  def above_market_average?
    if price >= 500000
      true
    else
      false
    end
  end

  def rooms_from_category(category)
    rooms_from_category = []
    @rooms.each do |room|
      if room.category == category
        rooms_from_category << room
      end
    end
    return rooms_from_category
  end

  def area
    area = 0
    @rooms.each do |room|
      area = room.area + area
    end
    return area
  end

  def details
    delaits = {
      "price" => 400000,
      "address" => "123 sugar lane"
    }
  end
end
