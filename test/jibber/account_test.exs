# Login

defmodule Jibber.AccountTest do
  use ExUnit.Case

  describe "login" do
    test "returns jibber user from email and password" do
      user = %{email: "fake@email.com", password: "valid_password"}
      assert Jibber.Account.login("fake@email.com", "valid_password") == {:ok, user}
    end
  end
end
