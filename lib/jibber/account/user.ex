defmodule Jibber.Account.User do
  use Norm
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    timestamps()
  end

  def changeset(user, params) do
    user
    |> cast(params, [:name])
    |> validate_required(:name)
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
