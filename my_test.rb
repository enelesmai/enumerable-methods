require './my_enumerable_module'

def multiply_els(arr)
  p arr.my_inject(:*)
  p arr.my_inject { |memo, n| memo * n }
end
