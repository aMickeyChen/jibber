defmodule JibberWeb.SessionController do
  use JibberWeb, :controller

  alias Jibber.Account

  plug :put_view, JibberWeb.SessionView

  def show(conn, _params) do
    render(conn, "login.html")
  end

  def create(conn, %{"user" => %{"name" => user_name}}) do
    user = Account.login(user_name)

    conn
    |> put_session(:current_user, user)
    |> redirect(to: "/chat")
  end
end
