defmodule Elixir101.Builder do
  alias Elixir101.Slides

  @unified_head """
  <html>
    <head>
      <meta charset="utf-8" />
      <link rel="stylesheet" href="css/slide.css" />
    </head>
    <body>
      <div class="slidewrap">
  """

  @unified_foot """
      </div>
      <script src="js/nav.js"></script>
    </body>
  </html>
  """

  def all do
    for slide <- [slide1] do
      slide_content = slide |> Earmark.to_html
      @unified_head <> slide_content <> @unified_foot
    end
  end

  defp slide1 do
    """
    # I am a slide
    I say important things
    """
  end
end
