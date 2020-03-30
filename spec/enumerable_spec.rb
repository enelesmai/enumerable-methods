require 'rspec'
require './my_enumerable_module.rb'

describe Enumerable do
  let(:array) { [1, 2, 3, 4, 5] }
  describe '#my_each' do
    it 'returns enum when no block is given' do
      expect(array.my_each).to be_an Enumerator
    end
    it 'returns self when block is given' do
      expect(array.my_each { |x| puts x }).to eql(array.each { |x| puts x })
    end
    it 'loops to each element to do the given operation' do
      expect(array.my_each { |x| x += 1 }).to eql(array.each { |x| x += 1 })
    end
  end
end
