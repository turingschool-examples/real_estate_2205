class House
  attr_reader :price, :address, :rooms
  attr_accessor :area

  def initialize(value, address)
    @value = value
    @address = address
    @rooms = []
    @area = area
    @price = price
  end

  def price
    @value.delete("$").to_i
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
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
    sqft = []
      @rooms.each do |room|
        sqft << room.area
      end
      area = sqft.reduce(:+).to_i
  #Just wanted to note that I am super proud of the reduce method I used for my ruby-exercises/basic_enums
  end

  def details
    details = {
      "price" => price,
      "address" => address
    }
  end

  def price_per_square_foot
    ppsf = price.to_f / area.to_f
       ppsf.round(2)
 #Went 3 minutes over looking through my notes for .round(2) which I had compledted in ruby-exercises/ints_and_floats
  end
end
