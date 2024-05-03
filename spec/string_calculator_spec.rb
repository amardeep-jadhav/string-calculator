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
	end
end