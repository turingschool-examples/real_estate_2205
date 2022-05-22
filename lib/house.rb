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

  def above_market_average?
  if @price.delete("$").to_i > 500000
    true
  end
    false
  end







end
