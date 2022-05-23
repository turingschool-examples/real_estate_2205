class Room

  attr_reader :category, :length, :width

  def initialize(category, length, width)
    @category = category
    @length = length
    @width = width.to_i
  end

  def area
    room_area = length * width
    return room_area
  end
end
