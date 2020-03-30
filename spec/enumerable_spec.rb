require 'rspec'
require './my_enumerable_module.rb'

describe Enumerable do
  let(:array) { [1, 2, 3, 4, 5] }
  let(:array_string) { %w[ant bear cat] }
  let(:array_with_nil) { [nil, true, 99] }
  let(:array_with_invalid_numeric) { [1, 2i, 3.14] }
  let(:array_with_invalid_float) { [1, 3.14, 42] }
  let(:array_with_one_nil) { [nil] }
  let(:array_with_false) { [nil, false] }
  let(:array_with_true) { [nil, false, true] }
  describe '#my_each' do
    it 'returns enum when no block is given' do
      expect(array.my_each).to be_an Enumerator
    end
    it 'returns self when block is given' do
      expected = array.each { |item| puts item }
      expect(array.my_each { |item| puts item }).to eql(expected)
    end
  end

  describe '#my_each_with_index' do
    context 'when no block is given' do
      it 'returns enum ' do
        expect(array.my_each_with_index).to be_an Enumerator
      end
    end
    context 'when block is given' do
      it 'returns self' do
        expected = array.each_with_index { |item, _index| puts item }
        expect(array.my_each_with_index { |item, _index| puts item }).to eql(expected)
      end
    end
    context 'when operation is given for item' do
      it 'loops to each item' do
        expected = array.each_with_index { |item, _index| item + 1 }
        expect(array.my_each_with_index { |item, _index| item + 1 }).to eql(expected)
      end
    end
    context 'when operation is given for index' do
      it 'loops to each index ' do
        expected = array.each_with_index { |_item, index| index + 1 }
        expect(array.my_each_with_index { |_item, index| index + 1 }).to eql(expected)
      end
      it 'loops to each index' do
        expected = array.each_with_index { |_item, index| index * 1 }
        expect(array.my_each_with_index { |_item, index| index * 1 }).to eql(expected)
      end
    end
  end

  describe '#my_select' do
    context 'when no block is given' do
      it 'returns enum when no block is given' do
        expect(array.my_select).to be_an Enumerator
      end
    end
    context 'when block is given' do
      it 'returns array containing the matching elements' do
        expected = array.my_select(&:even?)
        expect(array.my_select(&:even?)).to eql(expected)
      end
      it 'returns array containing the matching elements of an operation' do
        expected = array.my_select { |item| item % 3 == 0 }
        expect(array.my_select { |item| item % 3 == 0 }).to eql(expected)
      end
    end
  end

  describe '#my_all?' do
    context 'when no block is given' do
      it 'items are not false or nil' do
        expect(array_string.my_all?).to eql(array_string.all?)
      end
      it 'items are false or nil' do
        expect(array_with_nil.my_all?).to eql(array_with_nil.all?)
      end
      it 'items are not given' do
        expect([].my_all?).to eql([].all?)
      end
    end
    context 'when block is given' do
      it 'items are not false or nil' do
        expected = array_string.all? { |word| word.length >= 3 }
        expect(array_string.my_all? { |word| word.length >= 3 }).to eql(expected)
      end
      it 'items are not false or nil' do
        expected = array_string.all? { |word| word.length >= 4 }
        expect(array_string.my_all? { |word| word.length >= 4 }).to eql(expected)
      end
    end
    context 'when regular expression is given' do
      it 'items are not false or nil' do
        expected = array_string.all?(/t/)
        expect(array_string.my_all?(/t/)).to eql(expected)
      end
    end
    context 'when class is given' do
      it 'items are not false or nil' do
        expected = array_with_invalid_numeric.all?(Numeric)
        expect(array_with_invalid_numeric.my_all?(Numeric)).to eql(expected)
      end
    end
  end

  describe '#my_any?' do
    context 'when no block is given' do
      it 'returns false' do
        expect([].my_any?).to eql(false)
      end
      it 'items are false or nil' do
        expect(array_with_nil.my_any?).to eql(array_with_nil.any?)
      end
    end
    context 'when block is given' do
      it 'items are not false or nil' do
        expected = array_string.any? { |word| word.length >= 3 }
        expect(array_string.my_any? { |word| word.length >= 3 }).to eql(expected)
      end
      it 'items are not false or nil' do
        expected = array_string.any? { |word| word.length >= 4 }
        expect(array_string.my_any? { |word| word.length >= 4 }).to eql(expected)
      end
    end
    context 'when regular expression is given' do
      it 'items are not false or nil' do
        expected = array_string.any?(/t/)
        expect(array_string.my_any?(/t/)).to eql(expected)
      end
    end
    context 'when class is given' do
      it 'items are false or nil' do
        expected = array.any?(Numeric)
        expect(array.my_any?(Numeric)).to eql(expected)
      end
      it 'items are not false or nil' do
        expected = array_with_nil.any?(Numeric)
        expect(array_with_nil.my_any?(Numeric)).to eql(expected)
      end
    end
  end

  describe '#my_none?' do
    context 'when no block is given' do
      it 'returns false' do
        expect([].my_none?).to eql(true)
      end
      it 'items are nil' do
        expect(array_with_one_nil.my_none?).to eql(array_with_one_nil.none?)
      end
      it 'items are false or nil' do
        expect(array_with_false.my_none?).to eql(array_with_false.none?)
      end
      it 'at least one item is true' do
        expect(array_with_true.my_none?).to eql(array_with_true.none?)
      end
    end
    context 'when block is given' do
      it 'items are not false or nil' do
        expected = array_string.none? { |word| word.length == 5 }
        expect(array_string.my_none? { |word| word.length == 5 }).to eql(expected)
      end
      it 'items are not false or nil' do
        expected = array_string.none? { |word| word.length >= 4 }
        expect(array_string.my_none? { |word| word.length >= 4 }).to eql(expected)
      end
    end
    context 'when regular expression is given' do
      it 'items are not false or nil' do
        expected = array_string.none?(/d/)
        expect(array_string.my_none?(/d/)).to eql(expected)
      end
    end
    context 'when class is given' do
      it 'items are false or nil' do
        expected = array_with_true.none?(Numeric)
        expect(array_with_true.my_none?(Numeric)).to eql(expected)
      end
      it 'items are not false or nil' do
        expected = array_with_invalid_float.none?(Float)
        expect(array_with_invalid_float.my_none?(Float)).to eql(expected)
      end
    end
  end
end
