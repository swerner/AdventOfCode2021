class LanternfishSchool
  attr_reader :fish,:fish2

  def initialize(school_string)
    @fish = school_string.split(",").map(&:to_i)

    @fish2 = {
      0 => @fish.count(0),
      1 => @fish.count(1),
      2 => @fish.count(2),
      3 => @fish.count(3),
      4 => @fish.count(4),
      5 => @fish.count(5),
      6 => @fish.count(6),
      7 => @fish.count(7),
      8 => @fish.count(8)
    }
  end

  def go_forward(days)
    days.times { increment_day }
  end

  def go_forward2(days)
    days.times { increment_day2 }
  end

  private
  def increment_day2
    new_school = {
      0 => 0,
      1 => 0,
      2 => 0,
      3 => 0,
      4 => 0,
      5 => 0,
      6 => 0,
      7 => 0,
      8 => 0
    }

    new_school[8] = @fish2[0]
    new_school[0] = @fish2[1]
    new_school[1] = @fish2[2]
    new_school[2] = @fish2[3]
    new_school[3] = @fish2[4]
    new_school[4] = @fish2[5]
    new_school[5] = @fish2[6]
    new_school[6] = @fish2[0] + @fish2[7]
    new_school[7] = @fish2[8]

    @fish2 = new_school
  end

  def increment_day
    new_school = []
    number_of_eights = @fish.select{ |days| days == 0 }.count

    @fish.each do |fish_days|
      fish_days = fish_days - 1

      if fish_days < 0
        fish_days = 6
      end

      new_school << fish_days
    end

    @fish = new_school
    number_of_eights.times { @fish << 8 }
  end
end
