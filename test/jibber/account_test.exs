defmodule Jibber.AccountTest do
  use Jibber.DataCase

  import Jibber.Factory
  # import Norm
  # import ExUnitProperties, except: [gen: 1]

  alias Jibber.Account
  # alias Account.User

  # def email_genertor do
  #   ExUnitProperties.gen all(
  #                          name <- StreamData.string(:alphanumeric) |> StreamData.resize(10),
  #                          name != "",
  #                          domain_name <-
  #                            StreamData.string(:alphanumeric) |> StreamData.resize(10),
  #                          domain_name != "",
  #                          domain_tld <- StreamData.member_of(["com", "net", "io"])
  #                        ) do
  #     name <> "@" <> domain_name <> "." <> domain_tld
  #   end
  # end

  describe "login/2" do
    # property "users can login with email and password" do
    #   check all(
    #           email <- with_gen(User.email_spec(), email_genertor()) |> gen,
    #           password <- gen(User.password_spec())
    #         ) do
    #     insert(:user, email: email, password: password)

    #     assert %User{email: ^email, password: ^password} = Account.login(email, password)
    #   end
    # end

    test "returns jibber user from email and password" do
      user = insert(:user)

      assert Account.login(user.email, user.password) == {:ok, user}
    end
  end

  describe "list_users/1" do
    test "returns list of user from user IDs" do
      users = insert_list(3, :user)
      user_ids = Enum.map(users, & &1.id)

      assert {:ok, result} = Account.list_users(user_ids)
      assert Enum.sort_by(result, & &1.id) == Enum.sort_by(users, & &1.id)
    end
  end
end
