defmodule Jibber.Account do
  use Norm
  import Ecto.Query
  alias Jibber.Repo
  alias Jibber.Account.User

  @contract login(email :: User.email_spec(), password :: User.password_spec()) ::
              {:ok, one_of([User.s(), nil])}
  def login(email, password) do
    {:ok, Repo.get_by(User, email: email, password: password)}
  end

  def find_user(user_id) do
    Repo.get(User, user_id)
  end

  def list_users(ids) do
    query = from(u in User, where: u.id in ^ids)

    {:ok, Repo.all(query)}
  end
end
