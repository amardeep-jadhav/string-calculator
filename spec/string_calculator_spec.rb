require_relative '../src/string_calculator'

RSpec.describe StringCalculator do
	describe "#add" do 
		it "resturns 0 for any empty string" do
			calculator = StringCalculator.new
			expect(calculator.add('')).to eq(0)
		end

		it "returns the number for single number" do
			calculator = StringCalculator.new
			expect(calculator.add('1')).to eq(1)
		end

		it 'returns the sum of two numbers' do
      calculator = StringCalculator.new
      expect(calculator.add('1,2')).to eq(3)
    end

		it "returns sum of any amount of number" do
			calculator = StringCalculator.new
			expect(calculator.add("1,2,3,4")).to eq(10)
		end

		it 'handles new lines between numbers' do
      calculator = StringCalculator.new
      expect(calculator.add("1\n2,3")).to eq(6)
    end

		it 'supports different delimiters' do
			calculator = StringCalculator.new
			expect(calculator.add("//;\n1;2")).to eq(3)
		end

		it 'throws an exception for negative numbers' do
      calculator = StringCalculator.new
      expect { calculator.add('1,-2,3,-4') }.to raise_error("Negative numbers not allowed: -2, -4")
    end

		it 'Numbers bigger than 1000 should be ignored' do
			calculator = StringCalculator.new
			expect(calculator.add("1001,2")).to eq(2)
		end
	end
end