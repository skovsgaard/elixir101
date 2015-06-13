defmodule Elixir101 do
  def prep, do: Elixir101.Builder.all
  def start do
    prep
    {:ok, _} = Plug.Adapters.Cowboy.http Elixir101.Server, []
  end
end
