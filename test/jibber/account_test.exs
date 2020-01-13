# Login

defmodule Jibber.AccountTest do
  use  Jibber.DataCase
  import Jibber.Factory

  describe "login" do
    test "returns jibber user from email and password" do
      user = insert(:user)
      assert Jibber.Account.login("fake@email.com", "valid_password") == {:ok, user}
    end
  end
end
