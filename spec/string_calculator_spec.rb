require_relative '../src/string_calculator'

RSpec.describe StringCalculator do
	describe "#add" do 
		it "resturns 0 for any empty string" do
			calculator = StringCalculator.new
			expect(calculator.add('')).to eq(0)
		end
	end
end