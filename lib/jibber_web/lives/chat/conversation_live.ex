defmodule JibberWeb.Chat.ConversationLive do
  use Phoenix.LiveView

  alias Jibber.Chat
  alias JibberWeb.ChatView

  @default_assign %{messages: []}

  def render(assigns),
    do: ChatView.render("chat_panel/conversation.html", assigns |> IO.inspect(label: "ass"))

  def mount(session, socket) do
    %{"room_id" => room_id} = session
    if connected?(socket), do: Phoenix.PubSub.subscribe(Jibber.PubSub, "chat:#{room_id}")
    send(self(), {:load_messages, room_id})
    {:ok, assign(socket, @default_assign)}
  end

  def handle_info({:load_messages, room_id}, socket) do
    messages = Chat.list_messages(room_id)
    {:noreply, assign(socket, messages: messages)}
  end
end
