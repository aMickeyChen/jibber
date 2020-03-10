defmodule Jibber.Account.User do
  use Norm
  use Ecto.Schema

  schema "users" do
    field :name, :string
    timestamps()
  end

  def s() do
    schema(%{
      user:
        schema(%{
          name: spec(is_binary())
        })
    })
  end
end
