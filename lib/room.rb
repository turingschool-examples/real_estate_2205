class Room
  attr_reader :category,
              :area
  def initialize(category, length, width)
    @category = category
    @area = length.to_i * width.to_i
    @painted = false
  end

  def is_painted?
    @painted
  end

  def paint
    @painted = true 
  end
end
