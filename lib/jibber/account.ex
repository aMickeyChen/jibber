defmodule Jibber.Account do
  use Norm
  import Ecto.Query
  alias Jibber.Repo
  alias Jibber.Account.User

  @contract login(email :: User.email(), password :: User.password()) ::
              {:ok, one_of([User.s(), nil])}
  def login(email, password) do
    {:ok, Repo.get_by(User, email: email, password: password)}
  end

  def list_users(ids) do
    query = from(u in User, where: u.id in ^ids)

    {:ok, Repo.all(query)}
  end
end
