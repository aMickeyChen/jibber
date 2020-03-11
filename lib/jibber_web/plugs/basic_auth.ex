defmodule JibberWeb.BasicAuth do
  import Plug.Conn
  import Phoenix.Controller, only: [redirect: 2]
  alias Jibber.Account

  def init(_), do: []

  def call(conn, _opts) do
    case get_session(conn, :current_user) do
      %{name: name} ->
        conn

      _ ->
        conn
        |> put_status(301)
        |> redirect(to: "/login")
        |> halt
    end
  end
end
