class DiagnosticReport
  def initialize(input)
    @readings = input.map { |item| item.split("").map(&:to_i) }
  end

  def gamma_rate
    gamma_binary = []

    @readings[0].count.times do |position|
      digits = @readings.map { |reading| reading[position] }
      gamma_binary << most_common_digit(digits).to_s
    end

    binary_to_decimal(gamma_binary.join(""))
  end

  def epsilon_rate
    epsilon_binary = []

    @readings[0].count.times do |position|
      digits = @readings.map { |reading| reading[position] }
      epsilon_binary << least_common_digit(digits).to_s
    end

    binary_to_decimal(epsilon_binary.join(""))
  end

  def power_consumption
    gamma_rate * epsilon_rate
  end

  def co2_scrubber_rating
    output_list = @readings.clone

    @readings[0].count.times do |position|
      digits = output_list.map { |reading| reading[position] }
      least_common = least_common_digit(digits)
      output_list.filter! { |item| item[position] == least_common } unless output_list.size == 1
    end

    binary_to_decimal(output_list[0].map(&:to_s).join(""))
  end

  def oxygen_generator_rating
    output_list = @readings.clone

    @readings[0].count.times do |position|
      digits = output_list.map { |reading| reading[position] }
      most_common = most_common_digit(digits)
      output_list.filter! { |item| item[position] == most_common }
    end

    binary_to_decimal(output_list[0].map(&:to_s).join(""))
  end

  def life_support_rating
    co2_scrubber_rating * oxygen_generator_rating
  end

  def binary_to_decimal(binary_string)
    digits = binary_string.split("").map(&:to_i).reverse
    position_value = 1
    result = 0

    digits.each do |digit|
      result = result + (digit * position_value) if digit == 1
      position_value = position_value * 2
    end

    return result
  end

  def most_common_digit(digits)
    return digits.count(1) >= digits.count(0) ? 1 : 0
  end

  def least_common_digit(digits)
    return digits.count(1) >= digits.count(0) ? 0 : 1
  end
end

input = File.open("./problem_input").read.split("\n")
# input = File.open("./test_input").read.split("\n")

diagnostic_report = DiagnosticReport.new(input)
puts "Expected Gamma Rate: 22"
puts "Gamma Rate: #{diagnostic_report.gamma_rate}"
puts "Expected Epsilon Rate: 9"
puts "Epsilon Rate: #{diagnostic_report.epsilon_rate}"
puts "Expected CO2 Rating: 10"
puts "CO2 Rating: #{diagnostic_report.co2_scrubber_rating}"
puts "Expected Oxygen Generator Rating: 23"
puts "Oxygen Generator Rating: #{diagnostic_report.oxygen_generator_rating}"

puts "Expected Total Power Consumption: 198"
puts "Total Power Consumption: #{diagnostic_report.power_consumption}"
puts "Expected Life Support Rating: 230"
puts "Life Support Rating: #{diagnostic_report.life_support_rating}"
