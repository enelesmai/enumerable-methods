require "./my_enumerable_module"
require "./my_test"

puts "select an option to test enumerable"
puts "1) my_each"
puts "2) my_each_with_index"
puts "3) my_select"
puts "4) my_all?"
puts "5) my_any?"
puts "6) my_none?"
puts "7) my_count"
puts "8) my_map"
puts "9) my_inject"

option_enumerable = gets.chomp

case option_enumerable 
      
    # here 'when' statement contains 
    # the two values 
    when "1","2"
        puts "You order Espresso!"
      
    when "3","4"
        puts "You order Short Macchiato!"
      
    when "5","6"
        puts "You order Ristretto!"
      
    when "7","8"
        puts "You order Cappuccino!"
      
else
    "No Order!"
end

case option_enumerable
when "1"
    test_my_each
when "2"
    test_my_each_with_index
when "3"
    test_my_select
when "4"
    test_my_all
when "5"
    test_my_any
when "6"
    test_my_none
when "7"
    test_my_count
when "8"
    test_my_map
when "9"
    test_my_inject
else
    "That method doesn't exists"
end