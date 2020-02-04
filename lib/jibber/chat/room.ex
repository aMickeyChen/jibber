defmodule Jibber.Chat.Room do
  use Norm
  use Ecto.Schema

  schema "rooms" do
    field :user_ids, {:array, :integer}

    has_many :messages, Jibber.Chat.Message
    timestamps()
  end
end
