defmodule Elixir101 do
  def start do
    prep
    {:ok, _} = Plug.Adapters.Cowboy.http Elixir101.Server, []
  end
  
  defp prep, do: Elixir101.Builder.all
end
