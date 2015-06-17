defmodule Elixir101.Slides do
  def slides do
    [
    """
    # Ugh math...

    > In computer science, functional programming is a programming paradigm—a style of building the structure and elements of computer programs—that treats computation as the **evaluation of mathematical functions** and avoids changing-state and mutable data. It is a declarative programming paradigm, which means programming is done with expressions.

    - Yup, it's Wikipedia
    """,

    """
    # Ugh math...

    > In computer science, functional programming is a programming paradigm—a style of building the structure and elements of computer programs—that treats computation as the **evaluation of mathematical functions** and avoids changing-state and mutable data. It is a declarative programming paradigm, which means programming is done with expressions.

    - Yup, it's Wikipedia

    Math: Just say no.
    """,

    """
    # So why Elixir, then?
    """,

    """
    # So why Elixir, then?

    * The BEAM languages, Erlang, Elixir and Lisp Flavored Erlang
    are not purely functional

    """,

    """
    # So why Elixir, then?

    * The BEAM languages, Erlang, Elixir and Lisp Flavored Erlang
    are not purely functional

    * The world isn't pure.
    """,

    """
    # So why Elixir, then?

    * The BEAM languages, Erlang, Elixir and Lisp Flavored Erlang
    are not purely functional

    * The world isn't pure.

    * Sometimes things change and things inside computers do too. And it's okay to deal with that.
    """,

    """
    # So let's get into it
    """,

    """
    # So let's get into it - Basic types

    * Integer: `1`
    * Float: `1.0`
    * Boolean: `true`
    * Atom: `:atom #or a symbol in Ruby or Clojure terms`
    * String: `"elixir"`
    * List: `[1, 2, 3]`
    * Tuple: `{1, 2, 3}`
    """,

    """
    # So let's get into it - Operators

    * The ones you know: `+`, `-`, `*`, `/`
    * Slightly different ones: `div`, `rem`
    * List manipulation: `++`, `--`
    * String concatenation: `<>`
    * `and`, `or`, `||`, `&&`, `!`
    * `==`, `===`, `!=`, `>`, `<`, `>=`, `<=`
    """,

    """
    # Maps and keyword lists

    * `[key: "value"]`
    * `%{key: "value"}`
    """,

    """
    # Structs

    ```elixir
    defmodule Person do
      defstruct name: "defaultname", age: 20
      @type t :: %Person{name: String.t, age: integer}

    ```
    """,

    """
    # Pattern matching
    """,

    """
    # No `if else` or buts
    """,

    """
    # `while !loop`
    """,

    """
    # `Streams |> Enum`
    """,

    """
    # Modules
    """,

    """
    # Protocols
    """,

    """
    # Sigils
    """,

    """
    # Processes and why we're not talking about them
    """,

    """
    # Macros
    """
    ]
  end
end
