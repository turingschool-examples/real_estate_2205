class Room
  attr_reader :category, :paint

  def initialize(category, width, length)
    @category = category
    @width = width
    @length = length
    @area = area
    @is_painted = false
  end

  def area
    @width * @length.to_i
  end

  def is_painted?
    @is_painted
  end

  def paint
    @is_painted = true
  end 
end
