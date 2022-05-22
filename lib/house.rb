require 'pry'

class House
    attr_reader :price, :address, :rooms
    def initialize (price, address)
        @price = price.delete("$").to_i
        @address = address
        @rooms = []
    end

    def add_room(room)
        @rooms << room
    end

    def above_market_average?
        if @price > 500000
            true
        else
            false
        end
    end

    def rooms_from_category(room_category)
        @rooms.find_all { |room| room.category == room_category}
    end

    def area
        area = 0
        @rooms.each do |room|
            area += room.area
        end
        area
    end

    def details
        details = {}
        details["price"] = @price
        details["address"] = "#{@address}"
        details
    end

    def price_per_square_foot
        price = @price.to_f / area
        price.round(2)
    end

    def rooms_sorted_by_area
        @rooms.sort { |room_a, room_b| room_b.area <=> room_a.area }
    end

    def rooms_by_category
        @rooms.group_by {|room| room.category}
    end

end