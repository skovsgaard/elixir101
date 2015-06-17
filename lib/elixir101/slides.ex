defmodule Elixir101.Slides do
  def slides do
    [
    """
    # Ugh math...

    > In computer science, functional programming is a programming paradigm—a style of building the structure and elements of computer programs—that treats computation as the **evaluation of mathematical functions** and avoids changing-state and mutable data. It is a declarative programming paradigm, which means programming is done with expressions.

    - Yup, it's Wikipedia
    """,

    """
    # What is Erlang?

    * Created in 1986 at Ericsson.
    * Designed for telephony (switches).
    * Highly concurrent, distributed systems.
    * Process oriented → Shared nothing.
    * Fault tolerant → Let it crash.

    """,

    """
    # So if Erlang's so great, why are we talking about Elixir?

    * Practical (compile time) metaprogramming using macros.
    * Polymorphism via dynamic dispatch, using Protocols.
    * Productivity boost by eliminating boilerplate and streamlining certain APIs.
    * Complete tooling, namely `iex` and `mix`.

    """,

    """
    # So let's get into it
    """,

    """
    # So let's get into it - Functions

    ```elixir
    defmodule MyModule do
      def my_function(arg1, arg2), do: arg1 + arg2
    end
    ```

    Or for functions spanning multiple lines:

    ```elixir
    defmodule MyModule do
      def my_function(arg1, arg2) do
        arg1 + arg2
      end
    end

    MyModule.my_function(1, 2)
    ```
    """,

    """
    # So let's get into it - Functions

    ```elixir

    anonymous_function = fn(x) -> x * 2

    anonymous_function.(2)
    ```
    """,

    """
    # So let's get into it - Basic types

    * Integer: `1`
    * Float: `1.0`
    * Boolean: `true`
    * Atom: `:atom # or a symbol in Ruby or Clojure terms`
    * String: `"elixir"`
    * List: `[1, 2, 3]`
    * Tuple: `{1, 2, 3}` # a fixed length, non-enumerable collection
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
    # Enumerable data types

    * List: `["I'm", "a", "regular", "list"]`
    * Keyword list: `[key: "value"]` or really: `[{:key, "value"}]`
    * Map: `%{key: "value"}`
    """,

    """
    # Maps and keyword lists

    * List: It's just a (linked) list of things.
    * Keyword list: Useful if you need distinct order **or** duplicate keys.
    * Map: The "normal" associative data structure.
    """,

    """
    # Structs

    ```elixir
    defmodule Person do
      defstruct name: "defaultname", age: 20
    end
    ```
    """,

    """
    # Structs

    * Just maps, under the hood.
    * Particularly useful for use with Protocols or to avoid repeatedly creating maps of the same structure.

    """,

    """
    # Structs

    * Just maps, under the hood.
    * Particularly useful for use with Protocols or to avoid repeatedly creating maps of the same structure.
    * It's **NOT** an object.
    """,

    """
    # Pattern matching

    """,

    """
    # Pattern matching

    ```elixir
    {:ok, stuff_from_file} = File.read("imafile.txt")
    ```
    """,

    """
    # Pattern matching

    ```elixir
    def say_hi(name), do: IO.puts("Hi, \#{name}")
    def say_hi(name, weather) do
      IO.puts "Hi \#{name}. Lovely \#{weather} we're having, huh?"
    end

    say_hi("Fred", "sunshine")
    # > Hi, Fred. Lovely sunshine we're having, huh?
    ```
    """,

    """
    # But wait, there's more

    ```elixir
    def say_hi({lastname, :male}), do: "Hi, Mr. \#{lastname}"
    def say_hi({lastname, :female}), do: "Hi, Mrs. \#{lastname}"
    ```
    """,

    """
    # But wait, there's even more

    ```elixir
    def say_hi({lastname, :male}), do: "Hi, Mr. \#{lastname}"
    def say_hi({lastname, :female}), do: "Hi, Mrs. \#{lastname}"
    def say_hi({lastname, _}), do: "Hi, \#{lastname}"
    ```
    """,

    """
    # No else if or buts

    ```elixir
    if true do
      "yay"
    else
      "oh"
    end
    ```

    This is as much of an if statement as you'll get.
    """,

    """
    # No else if or buts

    ```elixir
    case (curr_mood) do
      :terrible -> "Sorry to hear"
      :mediocre -> "Oh..."
      :great -> "Yay!"
      _ -> "What is it, then?"
    end
    ```
    """,

    """
    # while !loops

    No loops in the entire language.

    So what do we do?
    """,

    """
    # Recursion

    ```elixir
    # say_hi/1
    def say_hi(name), do: IO.puts("Hi, \#{name}")

    # say_hi/2
    def say_hi(name, n) when n <= 1, do: say_hi(name)
    def say_hi(name, n) do
      IO.puts("Hi, \#{name}")
      say_hi(name, n-1)
    end
    ```
    """,

    """
    # Streams |> Enum

    ```elixir
    Enum.map [1,2,3,4], fn(num) ->
      num * num
    end
    ```

    or with the shorthand syntax

    ```elixir
    Enum.map [1,2,3,4], &(&1 * &1)
    ```
    """,

    """
    # Streams |> Enum

    List comprehensions are not for loops

    ```elixir
    for i <- 1..20 do
      i * 2
    end

    # > [2, 4, 6, 8, 10, 12, ... 28, 30, 32, 34, 36, 38, 40]
    ```
    """,

    """
    # Streams |> Enum

    Streams are lazy enumerables, i.e. ones that don't have to end.

    ```elixir
    1..100_000
    |> Stream.map(fn(item) -> item - 1 end)
    |> Stream.filter(fn(item) -> rem(item, 5) == 0 end)
    |> Enum.each(&IO.puts/1)
    ```
    """,

    """
    # Protocols

    * Polymorphism at runtime.
    * Single dispatch.
    * Not the polymorphism you may be used to.
    """,

    """

    ```elixir
    defprotocol Add do
      @doc "Adds a string or int to itself."
      def add_to_self(a)
    end

    defimpl Add, for: Integer do
      def add_to_self(a), do: a + a
    end

    defimpl Add, for: BitString do
      def add_to_self(a), do: a <> a
    end
    ```
    """,

    """
    # Protocols

    Why were structs useful again?

    ```elixir
    defmodule Tower do
      defstruct height: 200
    end

    defimpl Add, for: Tower do
      def add_to_self(tower), do: tower.height * 2
    end

    Add.add_to_self(%Tower{height: 900})
    # > 1800
    ```
    """,

    """
    # Processes and why we're not talking about them

    It's probably the biggest topic in Erlang and Elixir, so it deserves its own talk.

    ...which is why one is coming up later.
    """,

    """
    # Macros

    ```elixir
    defmacro unless(clause, options) do
      quote do
        if(!unquote(clause), do: unquote(options))
      end
    end
    ```
    """
    ]
  end

  defp name_hack(), do: '\#{name}'
  defp weather_hack, do: '\#{weather}'
end
