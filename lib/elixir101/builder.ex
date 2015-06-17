defmodule Elixir101.Builder do
  import Elixir101.Slides, only: [slides: 0]

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
    for slide <- slides do
      slide_content = slide |> Earmark.to_html
      file_content = @unified_head <> slide_content <> @unified_foot
      curr_slideno = Enum.find_index(slides, &(&1 == slide)) +1
      :ok = File.write(Path.expand("../../priv/static/#{to_string(curr_slideno)}.html", __DIR__), file_content)
    end
  end
end
