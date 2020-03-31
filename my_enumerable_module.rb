module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    my_array = to_a
    for i in 0...my_array.length
      yield my_array[i]
    end
    self
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
    result = true
    if block_given?
      return to_enum(:my_all) unless block_given?

      my_each do |item|
        result &&= yield(item)
      end
    elsif pattern.class == Class
      my_each do |item|
        result &&= item.is_a? pattern
      end
    elsif !pattern.nil?
      if pattern.class == Regexp
        my_each do |item|
          result &&= pattern.match?(item)
        end
      else
        my_each do |item|
          result &&= item == pattern
        end
      end
    else
      my_each do |item|
        result &&= false if item.nil? || item == false
      end
    end
    result
  end

  def my_any?(pattern = nil)
    result = false
    if block_given?
      return to_enum(:my_any) unless block_given?

      my_each do |item|
        result ||= yield(item)
      end
    elsif pattern.class == Class
      my_each do |item|
        result ||= item.is_a? pattern
      end
    elsif !pattern.nil?
      if pattern.class == Regexp
        my_each do |item|
          result ||= pattern.match?(item)
        end
      else
        my_each do |item|
          result ||= item == pattern
        end
      end
    else
      my_each do |item|
        result ||= !item.nil? && item != false
      end
    end
    result
  end

  def my_none?(pattern = nil)
    result = false
    if block_given?
      return to_enum(:my_any) unless block_given?

      my_each do |item|
        result ||= yield(item)
      end
    elsif pattern.class == Class
      my_each do |item|
        result ||= item.is_a? pattern
      end
    elsif !pattern.nil?
      if pattern.class == Regexp
        my_each do |item|
          result ||= pattern.match?(item)
        end
      else
        my_each do |item|
          result ||= item == pattern
        end
      end
    else
      my_each do |item|
        result ||= item == true
      end
    end
    !result
  end

  def my_count(value = nil)
    counter = 0
    if value.nil?
      return length unless block_given?

      my_each do |item|
        counter += 1 if yield item
      end
    else
      my_each do |item|
        counter += 1 if item == value
      end
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

  def my_inject(initial = nil, sym = nil)
    use_symbol = false
    my_array = to_a
    if initial.nil?
      memo = my_array[0]
      idx = 1
    else
      idx = 0
      use_symbol = true unless sym.nil?
      if initial.is_a? Symbol
        use_symbol = true
        sym = initial
        memo = sym == :* ? 1 : 0
      else
        memo = initial
      end
    end
    if use_symbol
      for i in idx...my_array.length
        case sym
        when :+
          memo += my_array[i]
        when :*
          memo *= my_array[i]
        end
      end
    else
      for i in idx...my_array.length
        memo = yield(memo, my_array[i])
      end
    end
    memo
  end
end
