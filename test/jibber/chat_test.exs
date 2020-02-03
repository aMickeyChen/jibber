defmodule Jibber.ChatTest do
  use Jibber.DataCase
  alias Jibber.Chat

  describe "list_rooms/1" do
    test "return list of rooms from user IDs" do
      user = insert(:user)
      rooms = insert_list(3, :room, user_ids: [user.id])
      assert Chat.list_rooms(user.id) == {:ok, rooms}
    end
  end

  describe "list_messages/1" do
    test "return a list of messages from room ID" do
      room = insert(:room)
      messages = insert_list(3, :message, room: room)

      assert {:ok, result} = Chat.list_messages(room.id)
      assert Enum.map(result, & &1.id) == Enum.map(messages, & &1.id)
    end
  end
end
