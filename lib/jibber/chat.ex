defmodule Jibber.Chat do
  use Norm
  import Ecto.Query
  alias Jibber.Repo
  alias Jibber.Chat.{Room, Message}

  def list_rooms(user_id) do
    query = from(r in Room, where: ^user_id in r.user_ids)

    {:ok, Repo.all(query)}
  end

  def list_messages(room_id) do
    query = from(m in Message, where: ^room_id == m.room_id)

    {:ok, Repo.all(query)}
  end

  def create_message(room_id, user_id, content) do

  end
end
