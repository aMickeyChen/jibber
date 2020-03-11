defmodule JibberWeb.PageController do
  use JibberWeb, :controller

  def index(conn, _params) do
    %{name: name} = get_session(conn, :current_user)
    render(conn, "chat.html", username: name)
  end
end
