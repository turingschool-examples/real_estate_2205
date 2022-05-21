class Room
  attr_reader :category, :length, :width, :painted
    def initialize (category, length, width)
      @category = category
      @length = length
      @width = width
      @area = []
      @painted = []
    end


end
