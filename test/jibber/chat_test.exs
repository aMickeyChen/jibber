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
      user = insert(:user)
      room = insert(:room, user_ids: [user.id])
      # messages

      assert Chat.list_messages(room.id)
    end
  end
end
