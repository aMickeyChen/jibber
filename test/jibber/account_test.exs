# Login

defmodule Jibber.AccountTest do
  use Jibber.DataCase
  import Jibber.Factory
  alias Jibber.Account

  describe "login/2" do
    test "returns jibber user from email and password" do
      user = insert(:user)
      assert Account.login(user.email, "valid_password") == {:ok, user}
    end
  end

  describe "list_users/1" do
    test "returns list of user from user IDs" do
      user_ids = insert_list(3, :user) |> Enum.map(& &1.id)
      assert {:ok, users} = Account.list_users(user_ids)
      # TODO: happy path only.
    end
  end
end
