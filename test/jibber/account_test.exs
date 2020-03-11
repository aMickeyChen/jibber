defmodule Jibber.AccountTest do
  use Jibber.DataCase

  import Jibber.Factory

  alias Jibber.Account

  describe "login/2" do
    test "returns jibber user from email and password" do
      user = insert(:user)

      assert Account.login(user.name) == user
      assert Repo.get_by(Account.User, name: user.name) |> Map.get(:id) == user.id
    end

    test "create a user with name if not found" do
      %{name: name} = build(:user)

      assert %{id: id, name: ^name} = Account.login(name)
      refute is_nil(id)
    end
  end

  describe "find_user/1" do
    test "get user from user id" do
      %{id: id} = insert(:user)
      assert %{id: ^id} = Account.find_user(id)
    end
  end

  describe "list_users/1" do
    test "returns list of user from user IDs" do
      users = insert_list(3, :user)
      user_ids = Enum.map(users, & &1.id)

      assert result = Account.list_users(user_ids)
      assert Enum.sort_by(result, & &1.id) == Enum.sort_by(users, & &1.id)
    end
  end
end
