require "./my_enumerable_module"

#TESTS
puts "\nmy_each"
[1,2,3].each { |x| puts x }
[1,2,3].my_each {|x| puts x}

puts "\nmy_each_with_index"
#sets the start index
[:foo, :bar, :baz].each.with_index(2) { |value, index| puts "#{index}: #{value}" }
[:foo, :bar, :baz].my_each_with_index(6) { |value, index| puts "#{index}: #{value}" }

puts "\nmy_select"
puts ["apple","berry","tomatoe","pinnepple","cocoa"].select { |x| x=="apple"}
puts ["apple","berry","tomatoe","pinnepple","cocoa"].my_select { |x| x=="apple"}

puts "\nmy_all"
puts %w[ant bear cat].all? { |word| word.length >= 3 }
puts %w[ant bear cat].my_all? { |word| word.length >= 3 }

puts "\nmy_any"
puts %w[ant bear cat].any? { |word| word.length >= 4 } 
puts %w[ant bear cat].my_any? { |word| word.length >= 4 } 

puts "\nmy_none"
puts %w{ant bear cat}.none? { |word| word.length == 4 }
puts %w{ant bear cat}.my_none? { |word| word.length == 4 }

puts "\nmy_count"
puts [1,2,4,2].count
puts [1,2,4,2].my_count

puts "\nmy_map"
puts [1,2,3,4].map{|n| n+1}
puts [1,2,3,4].my_map{|n| n+1}

puts "\nmy_inject"
puts([1, 2, 3, 4, 5].inject(10){|acc, val| acc * val})
puts([1, 2, 3, 4, 5].my_inject(10){|acc, val| acc * val})
