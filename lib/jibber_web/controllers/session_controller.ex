defmodule JibberWeb.SessionController do
  use JibberWeb, :controller

  alias JibberWeb.SessionView

  def show(conn, params) do
    render(conn, SessionView, "login.html")
  end
end
