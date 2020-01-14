defmodule Jibber.Account.User do
  use Ecto.Schema

  schema "users" do
    field :email, :string
    field :password, :string
    timestamps()
    # has_many :posts, Post
  end
end
