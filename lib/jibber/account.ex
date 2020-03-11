defmodule Jibber.Account do
  use Norm
  import Ecto.Query
  alias Jibber.Repo
  alias Jibber.Account.User

  @contract login(name :: spec(is_binary())) :: User.s()
  def login(name) do
    case Repo.get_by(User, name: name) do
      %{id: _} = user ->
        user

      _ ->
        User.changeset(%User{}, %{name: name})
        |> Repo.insert!()
    end
  end

  @contract find_user(user_id :: id_spec()) :: one_of([User.s(), nil])
  def find_user(user_id) do
    Repo.get(User, user_id)
  end

  @contract list_users(ids :: coll_of(id_spec())) :: coll_of(User.s())
  def list_users(ids) do
    query = from(u in User, where: u.id in ^ids)

    Repo.all(query)
  end

  defp id_spec do
    spec(is_integer() and (&(&1 > 0)))
  end
end
