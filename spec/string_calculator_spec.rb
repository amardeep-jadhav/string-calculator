require_relative '../src/string_calculator'

RSpec.describe StringCalculator do
  describe '#add' do
    context 'with empty string' do
      it 'returns 0' do
        calculator = StringCalculator.new
        expect(calculator.add('')).to eq(0)
      end
    end

    context 'with single number' do
      it 'returns the number' do
        calculator = StringCalculator.new
        expect(calculator.add('1')).to eq(1)
      end
    end

		context 'with two numbers' do
      it 'returns the sum' do
        calculator = StringCalculator.new
        expect(calculator.add('5,6')).to eq(11)
      end
    end

    context 'with multiple numbers' do
      it 'returns the sum' do
        calculator = StringCalculator.new
        expect(calculator.add('1,2,3')).to eq(6)
      end
    end

    context 'with new line delimiter' do
      it 'handles new lines between numbers' do
        calculator = StringCalculator.new
        expect(calculator.add("1\n2,3")).to eq(6)
      end
    end

    context 'with custom delimiter' do
      it 'supports custom delimiter' do
        calculator = StringCalculator.new
        expect(calculator.add("//;\n1;2;3")).to eq(6)
      end
    end

    context 'with negative numbers' do
      it 'raises an exception' do
        calculator = StringCalculator.new
        expect { calculator.add('1,-2,3,-4') }.to raise_error("Negative numbers not allowed: -2, -4")
      end
    end

    context 'with numbers larger than 1000' do
      it 'ignores numbers larger than 1000' do
        calculator = StringCalculator.new
        expect(calculator.add('1,1001,2')).to eq(3)
      end
    end
  end
end