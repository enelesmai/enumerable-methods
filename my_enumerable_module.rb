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
        self.my_each do |element|
            result.push(element) if yield(element)
        end
        result
    end
    def my_all?
        result = true
        self.my_each do |element|
            result = result && yield(element)
        end
        result
    end
    def my_any?
        result = true
        self.my_each do |element|
            result = result || yield(element)
        end
        result
    end
    def my_none?
        result = false
        self.my_each do |element|
            result = result || yield(element)
        end
        !result
    end
    def my_count
        self.length unless block_given?
    end
    def my_map
        result = []
        self.my_each do |element|
            result.push(yield(element))
        end
        result
    end
    def my_inject(acc=nil)
        if acc.nil?
          acc = self[0]
          idx = 1
        else
          idx = 0
        end
        my_each_with_index(idx) do |item|
          acc = yield(acc, item)
        end
        acc
    end
end