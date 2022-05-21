class House
  attr_reader :price, :address, :rooms
  attr_accessor :price

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    return true if @price >= "$500000"
    false
  end

  def rooms_from_category(category)
    rooms_array = []

    @rooms.each do |room|
      if room.category == category
        rooms_array << room
      end
    end
    rooms_array
  end

  def area
   @length *= @width.to_i
   total = @room_1.area + @room_2.area + @room_3.area + @room_4.area
  end

  def details
    details = {"price" => 400000, "address" => "123 sugar lane"}
  end


end
