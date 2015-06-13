defmodule Elixir101.Server do
  use Plug.Builder

  plug Plug.Static,
    at: "/",
    from: :elixir101,
    cache_control_for_vsn: "public, max-age=1"
  plug :not_found

  def not_found(conn, _) do
    send_resp conn, 404, "file not found"
  end
end
