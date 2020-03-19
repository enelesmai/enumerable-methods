module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?
    for i in 0...length
      yield self[i]
    end
  end

  def my_each_with_index(start_index = 0)
    return to_enum(:my_each_with_index) unless block_given?
    for idx in 0...length
      yield(self[idx], idx + start_index)
    end
    self
  end

  def my_select
    return to_enum(:my_select) unless block_given?
    result = []
    my_each do |item|
      result.push(item) if yield(item)
    end
    result
  end

  def my_all?(pattern = nil)
    return false if pattern.class == Regexp
    result = true
    if block_given?
      return to_enum(:my_all) unless block_given?
      my_each do |item|
        result &&= yield(item)
      end
    elsif pattern.class === Class
      my_each do |item|
        result &&= item.is_a? pattern   
      end
    else
      my_each do |item|
        result &&= item===pattern 
      end      
    end
    result
  end

  def my_any?(pattern = nil)
    return false if pattern.class == Regexp
    result = true
    if block_given?
      return to_enum(:my_any) unless block_given?
      my_each do |item|
        result ||= yield(item)
      end
    elsif pattern.class === Class
      my_each do |item|
        result ||= item.is_a? pattern   
      end
    else
      my_each do |item|
        result ||= item===pattern 
      end      
    end
    result
  end

  def my_none?
    return to_enum(:my_none) unless block_given?
    result = false
    my_each do |item|
      result ||= yield(item)
    end
    !result
  end

  def my_count
    return to_enum(:my_count) unless block_given?
    counter = 0
    return length unless block_given?

    my_each do |item|
      counter += 1 if yield item
    end
    counter
  end

  def my_map(procedure = nil)
    return to_enum(:my_map) unless block_given?
    result = []
    if procedure.nil?
      my_each do |item|
        result.push(yield(item))
      end
    else
      my_each do |item|
        result.push(procedure.call(item))
      end
    end
    result
  end

  def my_inject(initial = nil)
    return to_enum(:my_inject) unless block_given?
    if initial.nil?
      memo = self[0]
      idx = 1
    else
      idx = 0
      memo = initial
    end
    for i in idx...length
      memo = yield(memo, self[i])
    end
    memo
  end
end
