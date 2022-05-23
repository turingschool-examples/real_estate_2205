class House
	attr_reader :price, :address, :rooms

	def initialize(price, address)
		@price = price.delete("$").to_i
		@address = address
		@rooms = []
	end

	def add_room(room)
		@rooms << room
	end

	def above_market_average?
		if @price > 500000
			return true
		else
			return false
		end
	end

	def rooms_from_category(category)
		rooms_in_category = []
		@rooms.each do |room|
			if room.category == category
				rooms_in_category << room
			else
			end
		end
		return rooms_in_category
	end

	def area
		total_area = []
		@rooms.each do |room|
			total_area << room.area
		end
		return total_area.sum
	end

	def details
	 details = {}
	 details["price"] = @price
	 details["address"] = @address

	 return details
	end

	def price_per_square_foot
		price_per_square_foot = @price / area.to_f
		return price_per_square_foot.to_f
	end

end
