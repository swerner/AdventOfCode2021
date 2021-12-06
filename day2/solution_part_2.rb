class Submarine
  attr_reader :horizontal_position, :depth

  def initialize
    @horizontal_position = 0
    @depth = 0
    @aim = 0
  end

  def follow_course(course)
    course.each do |command|
      method, amount = command.split(" ")
      self.send(method.to_sym, amount.to_i)
    end
  end

  def forward(amount)
    @horizontal_position = @horizontal_position + amount
    @depth = @depth + (@aim * amount)
  end

  def down(amount)
    @aim = @aim + amount
  end

  def up(amount)
    @aim = @aim - amount
  end
end

course = "forward 5
down 5
forward 8
up 3
down 8
forward 2".split("\n")

test_submarine = Submarine.new
test_submarine.follow_course(course)

horizontal_position = test_submarine.horizontal_position
depth = test_submarine.depth

puts "Submarine Position:"
puts "Horizontal-  Actual: #{horizontal_position} Expected: 15"
puts "Depth- Acutal: #{depth} Expected: 60"
puts "Solution- Actual: #{horizontal_position * depth} Expected: 900"

course = File.open("./input").read.split("\n")
solution_submarine = Submarine.new
solution_submarine.follow_course(course)

horizontal_position = solution_submarine.horizontal_position
depth = solution_submarine.depth

puts "**** Solution ****"
puts "Submarine Position:"
puts "Horizontal-  Actual: #{horizontal_position}"
puts "Depth- Acutal: #{depth}"
puts "Solution- Actual: #{horizontal_position * depth}"
