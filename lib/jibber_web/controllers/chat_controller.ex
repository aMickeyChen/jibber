defmodule JibberWeb.ChatController do
  use JibberWeb, :controller

  def create(conn, %{"message" => msg}) do
    conn |> IO.inspect(label: "label")
    text(conn, "echo: " <> msg)
  end
end
