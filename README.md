# Enumerable Methods

## Project specifications

Enumerable module that gets mixed into the Array and Hash classes (among others) and provides you with lots of handy iterator methods.

## Built With

Concepts used on this project

- Ruby
- Loops
- Yield
- Describe, let and it for testing

Tools used on this project

- Visual Studio Code
- VSCode Ruby by Stafford Brunk
- Rubocop for Visual Studio Code
- RSpec testing framework

## Testing with RSpec 

To run the test cases with RSpec we have to follow this steps:

installing RSpec

    gem install rspec

Once that’s done, you can verify your version of RSpec with, for this project we had used the version 3.9 

    rspec --version

finally run for watch the results

    rspec


## Watch the result of RSpec

You can see the result of testing
```
Enumerable
  #my_each
    when no block is given
      returns enum     
    when block is given
      returns self
  #my_each_with_index
    when no block is given
      returns enum
    when block is given
      returns self
    when operation is given for item
      loops to each item
    when operation is given for index
      iterates each element with respective index
      iterates each element with respective index
  #my_select
    when no block is given
      returns enum when no block is given
    when block is given
      returns array containing the matching elements
      returns array containing the matching elements of an operation
  #my_all?
    when no block is given
      returns true if items are not nil or false
      returns false if any of the items is nil or false
      returns true if items are not given
    when block is given
      if items are not false or nil returns true if the block never returns false
      if items are not false or nil returns false when the block returns false.  
    when regular expression is given
      returns true when elements match with the given expression
    when class is given
      Items are not nil or false returns true when each item is an instance of the given class
  #my_any?
    when no block is given
      returns false
      returns true if any of the items is nil or false
    when block is given
      items are not false or nil returns true if the block returns at least once
      items are not false or nil returns false if the block never returns true
    when regular expression is given
      items are not false or nil returns true if any of the items returns true
    when class is given as the pattern param
      items are false or nil returns true when at least one item is an instance of the given class
      items are not false or nil returns true when at least one item is an instance of the given class
  #my_none?
    when no block is given
      returns true
      return true if items are nil
      return true if items are false or nil
      return false if at least one item is true
    when block is given and items are not false or nil
      return true if none items satisfies the condition
      return false if any items satisfies the condition
    when regular expression is given and items are not false or nil
      return true if none items satisfies the condition
      return false if any items satisfies the condition
    when class is given and items are false or nil
      return true if none items satisfies the condition
      return true if any items satisfies the condition
  #my_count
    when no block is given
      returns total of items in the array
    when an argument is given
      returns total of items that are equals
    when an block is given
      returns total of matching items
  #my_map
    when no block is given
      returns enum when no block is given
    when block is given
      returns array containing true or false
    when block not given and param is given
      returns array containing true or false
    when range and block are given
      returns array with the given operation
  #my_inject
    when a block is given using an array
      returns the final value of the sum
      returns the final value of the multiplication
    when a block is given using a range
      returns the final value of the sum
      returns the final value of the multiplication
    when a block is given using an array and with initial value
      returns the final value of the sum
      returns the final value of the multiplication
    when a block is given using a range and with initial value
      returns the final value of the sum
      returns the final value of the multiplication
    when a block is given using array of strings
      returns the longest string
    when a symbol is given
      returns the result of the operation
      returns the result of the operation
      returns the result of the operation with an initial value
      returns the result of the operation with an initial value

Finished in 0.28578 seconds (files took 0.34565 seconds to load)
54 examples, 0 failures
```


## Screenshot

![image](https://user-images.githubusercontent.com/5160907/76927718-644ecd80-68a5-11ea-88df-11a08b1f67a6.png)

## Live Demo

You can see the [live preview](https://repl.it/@enelesmai/enumerable-methods-1)


## Authors

👤 **Xóchitl Selene Flores Pérez**

- Github: [@enelesmai](https://github.com/enelesmai)
- Twitter: [@enelesmai](https://twitter.com/enelesmai)
- Linkedin: [xochitlselene](https://linkedin.com/in/xochitlselene)


## Contributing

This is an education project as a part of the Microverse so contributing is not accepted. 

Contributions, issues and feature requests are welcome!

Feel free to check the [issues](https://github.com/enelesmai/enumerable-methods/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgements

+ [Github](http://github.com/).
+ [The Odin Project](theodinproject.com/).

## License

This project is [MIT](lic.url) licensed.
