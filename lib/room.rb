class Room
attr_reader :category, :length, :width, :paint
attr_accessor :width, :paint, :length, :area
  def initialize(category, length, width)
    @category = category
    @length = length
    @width = width
    @paint = false
  end

  def area
    @length = length
    @width = width.to_i
    return @length * @width
  end

  def is_painted?
    return @paint
  end

  def paint
    @paint = true

  end


end
