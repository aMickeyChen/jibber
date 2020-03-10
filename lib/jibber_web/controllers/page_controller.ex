defmodule JibberWeb.PageController do
  use JibberWeb, :controller

  def index(conn, params) do
    %{"user" => username} = params
    render(conn, "chat.html", username: username)
  end
end
