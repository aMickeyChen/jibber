defmodule Jibber.Factory do
  use ExMachina.Ecto, repo: Jibber.Repo

  def user_factory do
    %Jibber.Account.User{
      email: Faker.Internet.email(),
      password: "valid_password"
    }
  end

  def room_factory do
    users = insert_list(2, :user)

    %Jibber.Chat.Room{
      user_ids: Enum.map(users, & &1.id)
    }
  end

  def message_factory do
    users = insert_list(2, :user)

    %Jibber.Chat.Room{
      user_ids: Enum.map(users, & &1.id)
    }
  end
end
