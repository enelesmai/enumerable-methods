require './my_enumerable_module'

def test_my_each
  puts "\nmy_each"
  [1, 2, 3].each { |x| puts x }
  [1, 2, 3].my_each { |x| puts x }
end

def test_my_each_with_index
  puts "\nmy_each_with_index"
  # sets the start index
  %i[foo bar baz].each.with_index(2) { |value, index| puts "#{index}: #{value}" }
  %i[foo bar baz].my_each_with_index(2) { |value, index| puts "#{index}: #{value}" }
end

def test_my_select
  puts "\nmy_select"
  puts %w[apple berry tomatoe pinnepple cocoa].select { |x| x == 'apple' }
  puts %w[apple berry tomatoe pinnepple cocoa].my_select { |x| x == 'apple' }
end

def test_my_all
  puts "\nmy_all"
  puts [1, 2, 3, 4, 5, 6].all? { |num| num <= 6 }
  puts [1, 2, 3, 4, 5, 6].my_all? { |num| num <= 6 }

  puts [1, 2, 3, 4, 5, 6].all?(Integer)
  puts [1, 2, 3, 4, 5, 6].my_all?(Integer)

  puts %w[dog door rod blade].all?(/o/)
  puts %w[dog door rod blade].my_all?(/o/)

  puts [1, 2, 3, 4, 5, 6].all?(3)
  puts [1, 2, 3, 4, 5, 6].my_all?(3)

  p [1, true, 'hi', []].all?
  p [1, true, 'hi', []].my_all?

  p ['d','d','d'].all?(/d/)
  p ['d','d','d'].my_all?(/d/)
end

def test_my_any
  puts "\nmy_any"
  puts [nil, false, true, []].any?
  puts [nil, false, true, []].my_any?

  puts [1, 2, 3, 4, 5, 6].any?(Integer)
  puts [1, 2, 3, 4, 5, 6].my_any?(Integer)

  puts %w[ant bear cat].any?(/d/)
  puts %w[ant bear cat].my_any?(/d/)

  puts %w[ant bear cat].any?('cat')
  puts %w[ant bear cat].my_any?('cat')

  p [nil, false, nil, false].any?
  p [nil, false, nil, false].my_any?

  p ['car'].any?(Integer)
  p ['car'].my_any?(Integer)

  p %w[ghetto wild hellz].any?(/z/)
  p %w[ghetto wild hellz].my_any?(/z/)

  p [2, 32, ].any?('cat')
  p [2, 32, ].my_any?('cat')

  block = proc { |num| num <= 2 }
  p [3, 43, 4, 234].any?(&block)
  p [3, 43, 4, 234].my_any?(&block)
end

def test_my_none
  puts "\nmy_none"
  puts [1, 2, 3, 4, 5, 6].none?(String)
  puts [1, 2, 3, 4, 5, 6].my_none?(String)

  puts %w[ant bear cat].none?(/d/)
  puts %w[ant bear cat].my_none?(/d/)

  puts %w[dog door rod blade].none?(5)
  puts %w[dog door rod blade].my_none?(5)

  p %w[hello milk milo].none?(/i/)
  p %w[hello milk milo].my_none?(/i/)

  p [nil, false, nil, false] .none?
  p [nil, false, nil, false] .my_none?
end

def test_my_count
  puts "\nmy_count"
  puts [1, 2, 3, 4, 5, 6].count
  puts [1, 2, 3, 4, 5, 6].my_count

  puts [1, 2, 3, 4, 5, 6].count(3)
  puts [1, 2, 3, 4, 5, 6].my_count(3)

  puts [1, 2, 3, 4, 5, 6].count { |x| (x % 2).zero? }
  puts [1, 2, 3, 4, 5, 6].my_count { |x| (x % 2).zero? }

  puts [1, 2, 3, 4, 5, 6].count.class
  puts [1, 2, 3, 4, 5, 6].my_count.class
end

def test_my_map
  puts "\nmy_map"
  puts [1, 2, 3, 4, 5, 6].map { |n| n + 1 }
  puts [1, 2, 3, 4, 5, 6].my_map { |n| n + 1 }
end

def test_my_inject
  puts "\nmy_inject"
  # sum numbers
  puts [1, 2, 3, 4, 5].inject { |sum, n| sum + n }
  puts [1, 2, 3, 4, 5].my_inject { |sum, n| sum + n }
  # multiply numbers
  puts([1, 2, 3, 4, 5].inject(10) { |product, n| product * n })
  puts([1, 2, 3, 4, 5].my_inject(10) { |product, n| product * n })
  # find the longest word
  longest = %w[cat sheep bear].inject do |memo, word|
    memo.length > word.length ? memo : word
  end
  puts longest
  longest = %w[cat sheep bear].my_inject do |memo, word|
    memo.length > word.length ? memo : word
  end
  puts longest
  # using sym
  puts [1, 2, 3, 4, 5].inject(:+)
  puts [1, 2, 3, 4, 5].my_inject(:+)

  p (1..5).inject(4) { |prod, n| prod * n }
  p (1..5).my_inject(4) { |prod, n| prod * n }

  p (5..10).inject(2, :*)
  p (5..10).my_inject(2, :*)
end
