module Enumerable
    def my_each
        for i in 0...self.length
            yield self[i]
        end
    end
    def my_each_with_index(start_index)
        for i in 0...self.length
            yield(self[i],start_index+i)
        end
    end
    def my_select
        result = []
        for i in 0...self.length
            if yield(self[i])
                result.push(self[i])
            end
        end
        result
    end
    def my_all?
        result = true
        for i in 0...self.length
            result = result && yield(self[i])
        end
        result
    end
    def my_any?
        result = true
        for i in 0...self.length
            result = result || yield(self[i])
        end
        result
    end
    def my_none?
        result = false
        for i in 0...self.length
            result = result || yield(self[i])
        end
        !result
    end
    def my_count
        self.length unless block_given?
    end
end

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