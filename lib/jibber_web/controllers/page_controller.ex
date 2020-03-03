defmodule JibberWeb.PageController do
  use JibberWeb, :controller

  alias JibberWeb.SessionView

  def index(conn, params) do
    %{"user" => username} = params
    render(conn, "chat.html", username: username)
  end

  def login(conn, params) do
    render(conn, SessionView, "login.html")
  end
end
