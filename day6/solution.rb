require_relative "./lanternfish_school.rb"

input = File.open("./problem_input").read
school = LanternfishSchool.new(input)


school.go_forward(80)
puts "Number of fish after 80 days: #{school.fish.count}"

school.go_forward(256)
puts "Number of fish after 256 days: #{school.fish.count}"


