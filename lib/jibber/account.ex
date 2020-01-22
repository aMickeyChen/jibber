defmodule Jibber.Account do
  use Norm
  import Ecto.Query
  alias Jibber.Repo
  alias Jibber.Account.User
  
  def email() do
    spec(is_binary() and &String.match?(&1, ~r([^@]+@[^\.]+\..+)))
  end

  def password() do
    spec(is_binary())
  end

  def user() do
    schema = schema(%{
      user: schema(%{
        email: email(),
        password: password(),
      })
    })
  end

  @contract login(email :: email(), password :: password()) :: user() 
  def login(email, password) do
    {:ok, Repo.get_by!(User, email: email, password: password)}
  end

  def list_users(ids) do
    query = from(u in User, where: u.id in ^ids)

    {:ok, Repo.all(query)}
  end
end
