class Room
  attr_reader :category,
              :area

  def initialize(category, length_in_ft, width_in_ft)
    @category = category
    @area = length_in_ft * width_in_ft.to_i
  end



end
