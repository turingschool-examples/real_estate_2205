class House
  attr_reader :price,
              :address,
              :rooms

  def initialize(price_string, address)
    @price = price_string.gsub("$", "").to_i #this might be breaking law
    @address = address
    @rooms = []
  end
end
