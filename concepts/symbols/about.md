# Symbols

Symbols in Ruby is a data type that is used to represent a name or an identifier.
Symbols are quite similar to strings, but they have a few differences.
Like symbols are immutable, and only one copy of any symbol exists at a given time.
The inmutability of symbols makes them useful in certain situations, since symbols are faster than strings.

In Ruby symbols are used as hash keys, and as method names.

## Creating a symbol

You can create a symbol by using the colon `:` followed by the name of the symbol.
The name of the symbol can be any combination of letters, numbers, and underscores.
But as with variables, the name of the symbol cannot start with a number.

```irb
>> :symbol
```

```irb
>> a = :symbol_1
=> :symbol_1

>> a
=> :symbol_1
```

## Symbol equality

In ruby so is a symbol unique and immutable.

```irb
>> :symbol == :symbol
=> true

>> :symbol.object_id
=> 701000

>> :symbol.object_id
=> 701000
```

In this example we can see that the object id of the symbol is the same, and that is because they are the same object.

## Symbol to string

You can convert a symbol to a string by using the `to_s` method.

```irb
>> :symbol.to_s
=> "symbol"
```

## String to symbol

You can convert a string to a symbol by using the `to_sym` method.

```irb
>> "symbol".to_sym
=> :symbol
```

## More symbols methods

`downcase` and `upcase` are methods that can be used on symbols.
They are used to convert the symbol to lowercase or uppercase.

```irb
>> :SYMBOL.downcase
=> :symbol

>> :symbol.upcase
=> :SYMBOL
```

`length` is a method that can be used on symbols.
It is used to get the length of the symbol.

```irb
>> :symbol.length
=> 6
```

```exercism/caution
You can't add or remove characters from a symbol once created.
That means that you can't use the `<<` or `+` methods on a symbol.
Every time you "update" a symbol, you are actually creating a new symbol.
```
