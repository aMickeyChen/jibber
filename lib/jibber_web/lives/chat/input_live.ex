defmodule JibberWeb.Chat.InputLive do
  use Phoenix.LiveView

  alias JibberWeb.ChatView

  def render(assigns), do: ChatView.render("chat_panel/input.html", assigns)

  def mount(session, socket) do
    %{"username" => username} = session
    assigns = %{input_text: "", username: username}
    {:ok, assign(socket, assigns)}
  end

  def handle_event("send-message", val, socket) do
    if val["code"] == "Enter" do
      Jibber.Chat.create_message(1, String.length(socket.assigns.username), val["value"])
      |> IO.inspect()

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
