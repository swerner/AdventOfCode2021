class VentField
  attr_reader :field

  def initialize
    @field = Hash.new(".")
  end

  def plot(ventline)
    if ventline.startX == ventline.endX || ventline.startY == ventline.endY
      plot_straight_line(ventline)
    else
      plot_diagonal_line(ventline)
    end
  end

  def total_overlapping_points
    @field.values.select { |value| value >= 2 }.count
  end

  private
  def plot_straight_line(ventline)
    xpos = [ventline.startX, ventline.endX]
    ypos = [ventline.startY, ventline.endY]

    (xpos.min..xpos.max).each do |x|
      (ypos.min..ypos.max).each do |y|
        field_value = @field[[x,y]]
        @field[[x,y]] = field_value == "." ? 1 : field_value + 1
      end
    end

  end

  def plot_diagonal_line(ventline)
    steps = (ventline.startX - ventline.endX).abs + 1
    xstep = ventline.startX > ventline.endX ? -1 : 1
    ystep = ventline.startY > ventline.endY ? -1 : 1
    x = ventline.startX
    y = ventline.startY

    steps.times do |step|
      field_value = @field[[x,y]]
      @field[[x,y]] = field_value == "." ? 1 : field_value + 1

      x += xstep
      y += ystep
    end
  end
end
