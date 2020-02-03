defmodule Jibber.Chat.Message do
  use Norm
  use Ecto.Schema
  alias Jibber.Chat.Room

  schema "messages" do
    field :content, :string
    field :user_id, :integer

    belongs_to :room, Room
    timestamps()
  end
end
