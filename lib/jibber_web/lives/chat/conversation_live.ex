defmodule JibberWeb.Chat.ConversationLive do
  use Phoenix.LiveView

  alias JibberWeb.ChatView

  def render(assigns), do: ChatView.render("chat_panel/conversation.html", assigns)

  def mount(session, socket) do
    %{"username" => username} = session
    assigns = %{input_text: "", username: username}
    {:ok, assign(socket, assigns)}
  end
end
