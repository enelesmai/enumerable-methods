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
  puts [1,2,3,4,5,6].all?{ |num| num <= 6 }
  puts [1,2,3,4,5,6].my_all?{ |num| num <= 6 }

  puts [1,2,3,4,5,6].all?(Integer)
  puts [1,2,3,4,5,6].my_all?(Integer)

  puts %w[dog door rod blade].all?(/o/)
  puts %w[dog door rod blade].my_all?(/o/)

  puts [1,2,3,4,5,6].all?(3)
  puts [1,2,3,4,5,6].my_all?(3) 
end

def test_my_any
  puts "\nmy_any"
  puts [nil, false, true, []].any?
  puts [nil, false, true, []].my_any?

  puts [1,2,3,4,5,6].any?(Integer)
  puts [1,2,3,4,5,6].my_any?(Integer)

  puts %w[ant bear cat].any?(/d/)
  puts %w[ant bear cat].my_any?(/d/)

  puts %w[ant bear cat].any?('cat')
  puts %w[ant bear cat].my_any?('cat')
end

def test_my_none
  puts "\nmy_none"
  puts [1,2,3,4,5].none?(String)
  puts [1,2,3,4,5].my_none?(String)

  puts %w{ant bear cat}.none?(/d/) 
  puts %w{ant bear cat}.my_none?(/d/) 

  puts %w[dog door rod blade].none?(5)
  puts %w[dog door rod blade].my_none?(5)
end

def test_my_count
  puts "\nmy_count"
  puts [1,2,3,4,5].count
  puts [1,2,3,4,5].my_count
  
  puts [1,2,3,4,5].count(3)
  puts [1,2,3,4,5].my_count(3)
  
  puts [1,2,3,4,5].count{ |x| x%2==0 }
  puts [1,2,3,4,5].my_count{ |x| x%2==0 }
  
  puts [1,2,3,4,5].count.class
  puts [1,2,3,4,5].my_count.class
end

def test_my_map
  puts "\nmy_map"
  puts [1, 2, 4, 2].map { |n| n + 1 }
  puts [1, 2, 4, 2].my_map { |n| n + 1 }
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
end
