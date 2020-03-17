defmodule JibberWeb.Chat.InputLive do
  use Phoenix.LiveView

  alias JibberWeb.ChatView

  def render(assigns), do: ChatView.render("chat_panel/input.html", assigns)

  def mount(session, socket) do
    %{"username" => username, "room_id" => room_id} = session
    assigns = %{input_text: nil, username: username, room_id: room_id}
    {:ok, assign(socket, assigns)}
  end

  def handle_info(:clear_input, socket) do
    {:noreply, assign(socket, :input_text, nil)}
  end

  def handle_event("send-message", val, socket) do
    %{assigns: %{room_id: room_id}} = socket

    case Jibber.Chat.create_message(room_id, 1, val["message"]) do
      {:ok, msg} -> Phoenix.PubSub.broadcast(Jibber.PubSub, "chat:#{room_id}", {:new_msg, msg})
      error -> error
    end

    send(self(), :clear_input)

    {:noreply, assign(socket, :input_text, "")}
  end
end
