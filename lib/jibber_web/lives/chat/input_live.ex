defmodule JibberWeb.Chat.InputLive do
  use Phoenix.LiveView

  alias JibberWeb.ChatView

  def render(assigns), do: ChatView.render("chat_panel/input.html", assigns)

  def mount(_params, session, socket) do
    session |> IO.inspect(label: "session")
    assigns = %{input_text: ""}
    {:ok, assign(socket, assigns)}
  end

  def handle_event("message-inputing", val, socket) do
    val |> IO.inspect(label: "value")

    {:noreply, socket}
  end
end
