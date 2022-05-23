class Room
attr_reader :category, :length, :width, :paint

  def initialize(category, length, width)
    @category = category
    @length = length
    @width = width
    @paint = false
  end

  def area
    @length.to_i * @width.to_i
  end

  def is_painted?
    @paint
  end

  def paint
    @paint = true
  end
  
end
