defmodule Jibber.Chat do
  use Norm
  import Ecto.Query
  alias Jibber.Repo
  alias Jibber.Chat.Room

  def list_rooms(user_id) do
    query = from(r in Room, where: ^user_id in r.user_ids)

    {:ok, Repo.all(query)}
  end
end
