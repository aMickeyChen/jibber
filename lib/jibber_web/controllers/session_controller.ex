defmodule JibberWeb.SessionController do
  use JibberWeb, :controller

  plug :put_view, JibberWeb.SessionView

  def show(conn, params) do
    render(conn, "login.html")
  end

  def create(conn, params) do
  end
end
