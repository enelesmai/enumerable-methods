module Enumerable
    def my_each
        for i in 0...self.length
            yield self[i]
        end
    end
    def my_each_with_index(start_index=0)
        for idx in 0...self.length
            yield(self[idx], idx+start_index)
        end
        self
    end
    def my_select
        result = []
        self.my_each do |item|
            result.push(item) if yield(item)
        end
        result
    end
    def my_all?
        result = true
        self.my_each do |item|
            result = result && yield(item)
        end
        result
    end
    def my_any?
        result = true
        self.my_each do |item|
            result = result || yield(item)
        end
        result
    end
    def my_none?
        result = false
        self.my_each do |item|
            result = result || yield(item)
        end
        !result
    end
    def my_count
        self.length unless block_given?
        if block_given?
        begin
            count = 0
            self.my_each do |item|
                count += 1 if yield item
                end
            end
            count
        end
    end
    def my_map(procedure=nil)
        result = []
        if procedure.nil?
          self.my_each do |item|
            result.push(yield(item))
          end
        else
          self.my_each do |item|
            result.push(procedure.call(item))
          end
        end
        result
    end
    def my_inject(initial=nil)
        if initial.nil?
          memo = self[0]
          idx = 1
        else
          idx = 0
          memo = initial
        end
        for i in idx...self.length 
            memo = yield(memo, self[i])
        end
        memo
    end
end