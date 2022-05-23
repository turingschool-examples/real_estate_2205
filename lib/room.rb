class Room

  attr_reader :category, :length, :width, :painted

  def initialize(category, length, width)
    @category = category
    @length = length
    @width = width.to_i
    @painted = false
  end

  def area
    room_area = length * width
    return room_area
  end

  def is_painted?
    if @painted == true
      true
    else
      false
    end
  end

  def paint
    @painted = true
  end
end
