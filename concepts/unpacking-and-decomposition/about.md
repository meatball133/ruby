# Decomposition and Multiple Assignment

Decomposition refers to the act of extracting the elements of a collection, such as an `array` or `hash`.
Decomposition values can then be assigned to variables within the same statement.

[Multiple assignment][multiple assignment] is the ability to assign multiple variables to decomposition values within one statement.
This allows for code to be more concise and readable, and is done by separating the variables to be assigned with a comma such as `first, second, third = [1,2,3]`.

The special splat operator(`*`) and double splat operator(`**`) often used in decomposition contexts.
Splat operator(`*`) can be used to combine multiple `arrays` into one `array` by _decomposing_ each into a new common `array`.
Double splat operator(`**`) can be used to combine multiple `hashes` into one `hash` by _decomposing_ each into a new common `hash`.

When the splat operator(`*`) is used without a collection, it _packs_ a number of values into a `array`.
This is often used in multiple assignment to group all "leftover" elements that do not have individual assignments into a single variable.

It is common in Ruby to also exploit this decomposing/packing behavior when using or defining functions that take an arbitrary number of positional or keyword arguments.
You will often see these "special" parameters defined as `def some_function(*args, **kwargs)` and the "special" arguments used as `some_function(*some_array, **some_hash)`.

```exercism/caution
`*<variable_name>` and `**<variable_name>` should not be confused with `*` and `**`. While `*` and `**` are used for multiplication and exponentiation respectively, `*<variable_name>` and `**<variable_name>` are used as packing and decomposition operators.
```

## Multiple assignment

Multiple assignment allows you to assign multiple variables in one line.
To separate the values, use a comma `,`:

```ruby
a, b = 1, 2
a # => 1
```

Multiple assignment is not limited to one data type:

```ruby
x, y, z = 1, "Hello", true
x # => 1

y # => 'Hello'

z # => true
```

Multiple assignment can be used to swap elements in `arrays`.
This practice is pretty common in [sorting algorithms][sorting algorithms].
For example:

```ruby
numbers = [1, 2]
numbers[0], numbers[1] = numbers[1], numbers[0]
numbers # => [2, 1]
```

If there are more variables than values, the extra variables will be assigned `nil`:

```ruby
a, b, c = 1, 2
b # => 2

c # => nil
```

If there are more values than variables, the extra values will be ignored:


```ruby
a, b, c = 1, 2, 3, 4
b # => 2

c # => 3
```

## Decomposition

In Ruby, it is possible to [decomposition the elements of `arrays`/`hashes`][decomposition] into distinct variables.
Since values appear within `arrays` in a specific order, they are unpacked into variables in the same order:

```ruby
fruits = ["apple", "banana", "cherry"]
x, y, z = fruits
x # => "apple"
```

If there are values that are not needed then you can use `_` to flag them:

```ruby
fruits = ["apple", "banana", "cherry"]
_, _, z = fruits
z # => "cherry"
```

### Deep decomposing

Decomposing and assigning values from a `arrays` inside of a `array` (_also known as a nested array_), works in the same way a shallow decomposing does, but needs qualifiers(`()`) to clarify the values context or position:

```ruby
fruits_vegetables = [["apple", "banana"], ["carrot", "potato"]]
(a, b), (c, d) = fruits_vegetables
a # => "apple"

d # => "potato"
```

You can also deeply unpack just a portion of a nested `array`:

```ruby
fruits_vegetables = [["apple", "banana"], ["carrot", "potato"]]
a, (c, d) = fruits_vegetables
a # => ["apple", "banana"]

c # => "carrot"
```

If the decomposing has variables with incorrect placement and/or an incorrect number of values, you will get a `syntax error`:

```ruby
fruits_vegetables = [["apple", "banana"], ["carrot", "potato"]]
(a, b), (d) = fruits_vegetables

syntax error, unexpected ')', expecting '.' or &. or :: or '['
((a, b), (d)) = fruits_vegetables
```

### Decomposing an array with single splat operator(`*`)

When [decomposing an `array`][decomposition] you can use the splat operator(`*`) to capture the "leftover" values.
This is clearer than slicing the `array` (_which in some situations is less readable_).
For example, we can extract the first element and then assign the remaining values into a new `array` without the first element:

```ruby
fruits = ["apple", "banana", "cherry", "orange", "kiwi", "melon", "mango"]
x, *last = fruits
x # => "apple"

last # => ["banana", "cherry", "orange", "kiwi", "melon", "mango"]
```

We can also extract the values at the beginning and end of the `array` while grouping all the values in the middle:

```ruby
fruits = ["apple", "banana", "cherry", "orange", "kiwi", "melon", "mango"]
x, *middle, y, z = fruits
y # => "melon"

middle # => ["banana", "cherry", "orange", "kiwi"]
```

We can also use `*` in deep decomposing:

```ruby
fruits_vegetables = [["apple", "banana", "melon"], ["carrot", "potato", "tomato"]]
(a, *rest), b = fruits_vegetables
a # => "apple"

rest # => ["banana", "melon"]
```

### Decomposing a hash

Decomposing a `hash` is a bit different than decomposing an `array`.
To be able to unpack a `hash` you need to convert it to an `array` first.
Otherwise there will be no decomposing:

```ruby
fruits_inventory = {apple: 6, banana: 2, cherry: 3}
x, y, z = fruits_inventory
x # => {:apple=>6, :banana=>2, :cherry=>3}

y # => nil
```

To convert an hash to an `array` you can use the `to_a` method:

```ruby
fruits_inventory = {apple: 6, banana: 2, cherry: 3}
fruits_inventory.to_a # => [[:apple, 6], [:banana, 2], [:cherry, 3]]

x, y, z = fruits_inventory.to_a
x # => [:apple, 6]
```

If you want to unpack the keys then you can use the `keys` method:
```ruby
fruits_inventory = {apple: 6, banana: 2, cherry: 3}
x, y, z = fruits_inventory.keys
x # => :apple
```

If you want to unpack the values then you can use the `values` method:

```ruby
fruits_inventory = {apple: 6, banana: 2, cherry: 3}
x, y, z = fruits_inventory.values
x # => 6
```

## Constructing

Constructing is the ability to group multiple values into one `array` that is assigned to a variable.
This is useful when you want to _decomposition_ values, make changes, and then _construct_ the results back into a variable.
It also makes it possible to perform merges on 2 or more `arrays`/`hashes`.

### Constructing an array with splat operator(`*`)

Constructing an `array` can be done using the splat operator(`*`).
This will pack all the values into an `array`.

```ruby
fruits = ["apple", "banana", "cherry"]
more_fruits = ["orange", "kiwi", "melon", "mango"]

# fruits and more_fruits are unpacked and then their elements are packed into combined_fruits
combined_fruits = *fruits, *more_fruits

combined_fruits # => ["apple", "banana", "cherry", "orange", "kiwi", "melon", "mango"]
```

### Constructing a hash with double splat operator(`**`)

Constructing a hash is done by using the double splat operator(`**`).
This will pack all **key**-**value** pairs from one hash into another hash, or combine two hashes together.

```ruby
fruits_inventory = {apple: 6, banana: 2, cherry: 3}
more_fruits_inventory = {orange: 4, kiwi: 1, melon: 2, mango: 3}

# fruits_inventory and more_fruits_inventory are unpacked into key-values pairs and combined.
combined_fruits_inventory = {**fruits_inventory, **more_fruits_inventory}

# then the pairs are packed into combined_fruits_inventory
combined_fruits_inventory # => {apple: 6, banana: 2, cherry: 3, orange: 4, kiwi: 1, melon: 2, mango: 3}
```

## Usage of splat operator(`*`) and double splat operator(`**`) with methods

### Constructing with method parameters

When you create a method that accepts an arbitrary number of arguments, you can use [`*args` or `**kwargs`][args and kwargs] in the method definition.
`*args` is used to pack an arbitrary number of positional (non-keyworded) arguments and
`**kwargs` is used to pack an arbitrary number of keyword arguments.

Usage of `*args`:

```ruby
# This method is defined to take any number of positional arguments

def my_method(*args)
  args
end

# Arguments given to the method are packed into an array

my_method(1, 2, 3) # => [1, 2, 3]

my_method("Hello") # => ["Hello"]

my_method(1, 2, 3, "Hello", "Mars") # => [1, 2, 3, "Hello", "Mars"]
```

Usage of `**kwargs`:

```ruby
# This method is defined to take any number of keyword arguments

def my_method(**kwargs)
  kwargs
end

# Arguments given to the method are packed into a dictionary

my_method(a: 1, b: 2, b: 3) # => {:a=>1,:b=>2,:c=>3}
```

If the method defined does not have any defined parameters for keyword arguments(`**kwargs` or `<key_word>: <value>`) then the keyword arguments will be packed into a hash and assigned to the last parameter.

```ruby
def my_method(a)
  a
end

my_method(a: 1, b: 2, b: 3) # => {:a=>1,:b=>2,:c=>3}
```

`*args` and `**kwargs` can also be used in combination with one another:

```ruby
def my_method(*args, **kwargs)
  p args.sum
  for (key, value) in kwargs.to_a
    p key.to_s + " = " + value.to_s
  end
end


my_method(1, 2, 3, a: 1, b: 2, c: 3)
... 6
... "a = 1"
... "b = 2"
... "c = 3"
```

You can also write parameters before and after `*args` to allow for specific positional arguments.
This works the same way as decomposing an array.

```exercism/caution
[Arguments have to be structured](https://www.python-engineer.com/courses/advancedpython/18-function-arguments/)

`def my_method(<positional_args>, *args, <positional_args>, <key-word_args>, **kwargs)`

If you don't follow this order then you will get an error.
```

```ruby
def my_method(a, b, *args)
  p a
  p b
  p args
end

my_method(1, 2, 3, 4, 5)
... 1
... 2
... [3, 4, 5]
```

You can write positional arguments before and after `*args`:

```ruby
def my_method(a, *middle, b)
  middle
end

my_method(1, 2, 3, 4, 5) # => [2, 3, 4]
```

You can also combine positional arguments, args, key-word arguments and kwargs:

```ruby
def my_method(first, *args, last, a:, **kwargs)
  p first
  p args
  p last
  p a
  p kwargs
end

my_method(1, 2, 3, 4, 5, a: 6, b: 7, c: 8)
... 1
... [2, 3, 4]
... 5
... 6
... {:b=>7, :c=>8}
```

Writing arguments in an incorrect order will result in an error:

```ruby
def my_method(a:, **kwargs, first, *args, last)
  args
end

my_method(1, 2, 3, 4, a: 5)

syntax error, unexpected local variable or method, expecting & or '&'
... my_method(a:, **kwargs, first, *args, last)
```

### Decomposing into method calls

You can use splat operator(`*`) to unpack an `array` of arguments into a method call:

```ruby
def my_method(a, b, c)
  p c
  p b
  p a
end

numbers = [1, 2, 3]
my_method(*numbers)
... 3
... 2
... 1
```

You can also use double splat operator(`**`) to unpack a `hash` of arguments into a method call:

```ruby
def my_method(a:, b:, c:)
  p c
  p b
  p a
end

numbers = {a: 1, b: 2, c: 3}
my_method(**numbers)
... 3
... 2
... 1
```

[args]: https://docs.ruby-lang.org/en/3.1/syntax/methods_rdoc.html#label-Array-2FHash+Argument
[kwargs]: https://docs.ruby-lang.org/en/3.1/syntax/methods_rdoc.html#label-Keyword+Arguments
[multiple assignment]: https://docs.ruby-lang.org/en/3.1/syntax/assignment_rdoc.html#label-Multiple+Assignment
[sorting algorithms]: https://en.wikipedia.org/wiki/Sorting_algorithm
[decomposition]: https://docs.ruby-lang.org/en/3.1/syntax/assignment_rdoc.html#label-Array+Decomposition
