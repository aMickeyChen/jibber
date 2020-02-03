defmodule Jibber.Chat.Room do
  use Norm
  use Ecto.Schema

  schema "rooms" do
    field :email, :string
    field :password, :string
    timestamps()
    # has_many :posts, Post
  end
end
