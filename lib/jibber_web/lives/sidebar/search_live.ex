defmodule JibberWeb.Sidebar.SearchLive do
  use Phoenix.LiveView
  alias JibberWeb.ChatView

  def render(assigns),
    do: ChatView.render("user_sidebar/search.html", assigns)

  # def mount(session, socket) do
  # end

  # def handle_info({}, socket) do
  # end
end
