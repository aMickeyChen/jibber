defmodule JibberWeb.Chat.InputLive do
  use Phoenix.LiveView

  alias JibberWeb.ChatView

  def render(assigns), do: ChatView.render("chat_panel/input.html", assigns)

  def mount(session, socket) do
    %{"username" => username, "room_id" => room_id} = session
    assigns = %{input_text: "", username: username, room_id: room_id}
    {:ok, assign(socket, assigns)}
  end

  def handle_event("send-message", val, socket) do
    %{assigns: %{room_id: room_id}} = socket

    if val["code"] == "Enter" && val["value"] != "" do
      case Jibber.Chat.create_message(room_id, 1, val["value"]) do
        {:ok, msg} -> Phoenix.PubSub.broadcast(Jibber.PubSub, "chat:#{room_id}", {:new_msg, msg})
        error -> error
      end

      # socket.assigns.input_text = ""
      {:noreply, socket}
    else
      {:noreply, socket}
    end

    # val |> IO.inspect()
    # socket.assigns |> IO.inspect(label: "value")
    # {:noreply, socket}
  end
end
