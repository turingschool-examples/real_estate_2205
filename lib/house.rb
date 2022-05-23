require 'pry'

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

  #I am stuck here. I keep getting an error that says expected: "400000" got: 400000
  # I fixed it...but I am unsure how. All i did was type, delete, and then retype. Maybe this was a 'save' issue?
  def above_market_average?
    if @price.delete("$").to_i > 500000
      true
    else
      false
    end
  end


  def rooms_from_category(category)
    @rooms.find_all do |room|
      room.category == category
    end
  end


  def area
    area = 0
    rooms.each do |room|
      area += room.area
    end
    return area
  end



  def details
    {
      "price" => @price.delete("$").to_i,
      "address" => @address
    }
  end























end
