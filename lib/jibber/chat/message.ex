defmodule Jibber.Chat.Message do
  use Norm
  use Ecto.Schema
  import Ecto.Changeset
  alias Jibber.Chat.Room

  schema "messages" do
    field :content, :string
    field :user_id, :integer

    belongs_to :room, Room
    timestamps()
  end

  def changeset(message, params) do
    message
    |> cast(params, [:content])
    |> foreign_key_constraint(:room_id)
    |> foreign_key_constraint(:user_id)
  end
end
