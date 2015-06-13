defmodule Elixir101.Builder do
  alias Elixir101.Slides

  @unified_head """
  <html>
    <head>
      <meta charset="utf-8" />
      <link rel="stylesheet" href="/css/slide.css" />
    </head>
    <body>
      <div class="slidewrap">
  """

  @unified_foot """
      </div>
      <script src="/js/nav.js"></script>
    </body>
  </html>
  """

  def all do
    slides = [slide1, slide2, slide3, slide4, slide5, slide6, slide7, slide8, slide9, slide10]
    for slide <- slides do
      slide_content = slide |> Earmark.to_html
      file_content = @unified_head <> slide_content <> @unified_foot
      curr_slideno = Enum.find_index(slides, &(&1 == slide)) +1
      :ok = File.write(Path.expand("../../priv/static/#{to_string(curr_slideno)}.html", __DIR__), file_content)
    end
  end

  defp slide1 do
    """
    # Ugh math...

    >In computer science, functional programming is a programming paradigm—a style of building the structure and elements of computer programs—that treats computation as the **evaluation of mathematical functions** and avoids changing-state and mutable data. It is a declarative programming paradigm, which means programming is done with expressions.

    - Yup, it's Wikipedia
    """
  end

  defp slide2 do
    """
    # Ugh math...

    >In computer science, functional programming is a programming paradigm—a style of building the structure and elements of computer programs—that treats computation as the **evaluation of mathematical functions** and avoids changing-state and mutable data. It is a declarative programming paradigm, which means programming is done with expressions.

    - Yup, it's Wikipedia

    Math: Just say no.
    """
  end

  defp slide3 do
    """
    # So why Elixir, then?
    """
  end

  defp slide4 do
    """
    # So why Elixir, then?

    * The world isn't pure.
    """
  end

  defp slide5 do
    """
    # So why Elixir, then?

    * The world isn't pure.

    * The BEAM languages, Erlang, Elixir and Lisp Flavored Erlang
    are not purely functional
    """
  end

  defp slide6 do
    """
    # So why Elixir, then?

    * The world isn't pure.

    * The BEAM languages, Erlang, Elixir and Lisp Flavored Erlang
    are not purely functional

    * Sometimes things change and things inside computers do too. And it's okay to deal with that.
    """
  end

  defp slide7 do
    """
    # Processes

    Erlang and Elixir see the world in terms of processes, i.e. not what things are, but what they do.
    """
  end

  defp slide8 do
    """
    # Processes

    Erlang and Elixir see the world in terms of processes, i.e. not what things are, but what they do.

    ...but I'm not gonna steal that topic from the talk coming up later.
    """
  end

  defp slide9 do
    """
    # So let's get into it
    """
  end

  defp slide10 do
    """
    # So let's get into it - Basic types

    * Integer: `1`
    * Float: `1.0`
    * Boolean: `true`
    * Atom: `:atom #or a symbol in Ruby or Clojure terms`
    * String: `"elixir"`
    * List: `[1, 2, 3]`
    * Tuple: `{1, 2, 3}`
    """
  end
end
