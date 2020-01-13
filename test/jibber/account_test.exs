# Login

defmodule Jibber.AccountTest do
  use Jibber.DataCase
  import Jibber.Factory
  alias Jibber.Account

  describe "login/2" do
    test "returns jibber user from email and password" do
      user = insert(:user)
      assert Account.login("fake@email.com", "valid_password") == {:ok, user}
    end
  end

  describe "list_users/1" do
    test "returns list of user from user IDs" do
      # TODO: Implement this.
    end
  end
end
