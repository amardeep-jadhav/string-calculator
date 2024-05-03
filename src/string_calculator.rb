class StringCalculator
	def add(input)
		return 0 if input.empty?

		if input.start_with?("//")
			delimiter = input[2] 
		end
		
		if input.include?("\n")
			numbers = input.gsub("\n", ',').split(',')
    end
		
		if(input.include?("\n") && delimiter)
			numbers = input.gsub("\n", ',').split(delimiter || ',').last(2)
		end
		
		negative_numbers = input.split(',').map(&:to_i).select { |n| n < 0 }
		if(negative_numbers.any?)
			raise "Negative numbers not allowed: #{negative_numbers.join(', ')}"
		end

		if numbers
			numbers.join(',').split(',').map(&:to_i).sum
		else
			input.split(',').map(&:to_i).sum
		end
	end
end