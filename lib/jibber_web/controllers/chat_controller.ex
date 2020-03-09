defmodule JibberWeb.ChatController do
  use JibberWeb, :controller

  def create(conn, %{"message" => msg}) do
    text(conn, "echo: " <> msg)
  end
end
