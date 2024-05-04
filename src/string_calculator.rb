class StringCalculator
  def add(input)
    return 0 if input.empty?

    delimiter = extract_delimiter(input)
    numbers = extract_numbers(input, delimiter)
    validate_numbers(numbers)

    sum_valid_numbers(numbers)
  end

  private

  def extract_delimiter(input)
    input.start_with?("//") ? input[2] : ','
  end

  def extract_numbers(input, delimiter)
    numbers_str = input.include?("\n") ? input.gsub("\n", ',') : input
		numbers_str.split(delimiter).join(",").split(',').map(&:to_i)
  end

  def validate_numbers(numbers)
    negative_numbers = numbers.select { |n| n < 0 }
    raise "Negative numbers not allowed: #{negative_numbers.join(', ')}" if negative_numbers.any?
  end

  def sum_valid_numbers(numbers)
    numbers.reject { |num| num >= 1000 }.sum
  end
end
