class Room
  attr_reader :category, :length, :width

  def initialize (category, length, width)
    @room_category = category
    @length = length
    @width = width

  end

  def area
    @new_width = @width.to_i
    @new_width * @length
  end



end
