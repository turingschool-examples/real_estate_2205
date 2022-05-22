require_relative 'room'

class House
  attr_reader :price, :address, :rooms, :house_details
  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
    @house_details = {}
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    @price.slice!(0)
    @price.to_i > 500000
  end

  def rooms_from_category(category)
    @rooms.select {|room| room.category == category}
  end

  def area
    area_house = []
    @rooms.each {|room| area_house << room.area}
    area_house.sum
  end

  def details
    @price.slice!(0)
    @house_details["price"] = @price.to_i
    @house_details["address"]= @address
    @house_details
  end

end

require 'pry'; binding.pry
