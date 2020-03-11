defmodule Jibber.Factory do
  use ExMachina.Ecto, repo: Jibber.Repo

  def user_factory do
    %Jibber.Account.User{
      name: Faker.Name.name()
    }
  end

  def room_factory do
    users = insert_list(2, :user)

    %Jibber.Chat.Room{
      user_ids: Enum.map(users, & &1.id)
    }
  end

  def message_factory do
    room = insert(:room)

    %Jibber.Chat.Message{
      user_id: List.first(room.user_ids),
      room: room,
      content: "foobar"
    }
  end
end
