module Enumerable
  def my_each
    for i in 0...length
      yield self[i]
    end
  end

  def my_each_with_index(start_index = 0)
    for idx in 0...length
      yield(self[idx], idx + start_index)
    end
    self
  end

  def my_select
    result = []
    my_each do |item|
      result.push(item) if yield(item)
    end
    result
  end

  def my_all?
    result = true
    my_each do |item|
      result &&= yield(item)
    end
    result
  end

  def my_any?
    result = true
    my_each do |item|
      result ||= yield(item)
    end
    result
  end

  def my_none?
    result = false
    my_each do |item|
      result ||= yield(item)
    end
    !result
  end

  def my_count
    counter = 0
    return length unless block_given?
    my_each do |item|
      yield item ? counter += 1 : counter += 0
    end
    counter
  end

  def my_map(procedure = nil)
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
