defmodule JibberWeb.PageController do
  use JibberWeb, :controller

  def index(conn, _params) do
    render(conn, "chat.html")
  end
end
