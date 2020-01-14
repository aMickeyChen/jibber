defmodule Jibber.Account do
  import Ecto.Query
  alias Jibber.Repo
  alias Jibber.Account.User

  def login(email, password) do
    {:ok, Repo.get_by!(User, email: email, password: password)}
  end

  def list_users(ids) do
    query = from(u in User, where: u.id in ^ids)

    {:ok, Repo.all(query)}
  end
end
