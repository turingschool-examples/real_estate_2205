class Room
  attr_reader :category, :area

  def initialize(category, num1, num2)
    @category = category
    @area = num1 * num2.to_i
  end
end
