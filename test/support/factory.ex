defmodule Jibber.Factory do
  use ExMachina.Ecto, repo: Jibber.Repo

  def user_factory do
    %Jibber.Account.User{
      email: "fake@email.com",
      password: "valid_password",
    }
  end
end
