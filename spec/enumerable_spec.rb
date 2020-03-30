require 'rspec'
require './my_enumerable_module.rb'

describe Enumerable do
  let(:array) { [1, 2, 3, 4, 5] }
  describe '#my_each' do
    it 'returns enum when no block is given' do
      eitempect(array.my_each).to be_an Enumerator
    end
    it 'returns self when block is given' do
      expected = array.each { |item| puts item }
      eitempect(array.my_each { |item| puts item }).to eql(expected)
    end
  end

  describe '#my_each_with_index' do
    context 'when no block is given' do
      it 'returns enum ' do
        eitempect(array.my_each_with_index).to be_an Enumerator
      end
    end
    context 'when block is given' do
      it 'returns self' do
        expected = array.each_with_index { |item, _index| puts item }
        eitempect(array.my_each_with_index { |item, _index| puts item }).to eql(expected)
      end
    end
    context 'when operation is given for item' do
      it 'loops to each item' do
        expected = array.each_with_index { |item, _index| item + 1 }
        eitempect(array.my_each_with_index { |item, _index| item + 1 }).to eql(expected)
      end
    end
    context 'when operation is given for index' do
      it 'loops to each index ' do
        expected = array.each_with_index { |_item, index| index + 1 }
        eitempect(array.my_each_with_index { |_item, index| index + 1 }).to eql(expected)
      end
      it 'loops to each index' do
        expected = array.each_with_index { |_item, index| index * 1 }
        eitempect(array.my_each_with_index { |_item, index| index * 1 }).to eql(expected)
      end
    end
  end
end
