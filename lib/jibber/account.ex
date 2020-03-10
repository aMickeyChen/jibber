defmodule Jibber.Account do
  use Norm
  import Ecto.Query
  alias Jibber.Repo
  alias Jibber.Account.User

  @contract login(name :: spec(is_binary())) ::
              one_of([User.s(), nil])
  def login(name) do
    Repo.get_by(User, name: name)
  end

  def find_user(user_id) do
    Repo.get(User, user_id)
  end

  def list_users(ids) do
    query = from(u in User, where: u.id in ^ids)

    {:ok, Repo.all(query)}
  end
end
