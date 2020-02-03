defmodule Jibber.Account.User do
  use Norm
  use Ecto.Schema

  schema "users" do
    field :email, :string
    field :password, :string
    timestamps()
    # has_many :posts, Post
  end

  def email_spec() do
    spec(is_binary() and (&String.match?(&1, ~r([^@]+@[^\.]+\..+))))
  end

  def password_spec() do
    spec(is_binary() and (&(String.length(&1) >= 8)))
  end

  def s() do
    schema(%{
      user:
        schema(%{
          email: email_spec(),
          password: password_spec()
        })
    })
  end
end