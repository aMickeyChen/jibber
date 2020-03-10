defmodule JibberWeb.BasicAuth do
  import Plug.Conn
  import Phoenix.Controller, only: [redirect: 2]
  alias Jibber.Account

  @realm "Basic realm=\"Chat\""

  def init(opts), do: opts |> IO.inspect(label: "opts")

  def call(conn, opts) do
    case get_req_header(conn, "authorization") do
      ["Basic:" <> user_id] -> verify(conn, user_id, opts)
      _ -> unauthorized(conn, opts)
    end
  end

  defp verify(conn, id, opts) do
    case Account.get_user(id) do
      %Account.User{} = user -> conn
      _ -> unauthorized(conn, opts)
    end
  end

  defp unauthorized(conn, opts) do
    case Keyword.get(opts, :redirect_to) do
      nil ->
        conn
        |> put_resp_header("www-authenticate", @realm)
        |> send_resp(401, "unauthorized")
        |> halt()

      redirect_path ->
        conn
        |> redirect(to: redirect_path)
    end
  end
end
