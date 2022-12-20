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

[multiple assignment]: https://docs.ruby-lang.org/en/3.1/syntax/assignment_rdoc.html#label-Multiple+Assignment
