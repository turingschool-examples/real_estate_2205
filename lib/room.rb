class Room
  attr_reader :category,
              :length,
              :width,
              :area

  def initialize(category, length, width)
    @category = category.to_sym
    @length = length
    @width = width.to_i
    @paint = false
    @area = @length * @width
  end

  def paint
    @paint = true
  end

  def is_painted?
    @paint
  end
end
