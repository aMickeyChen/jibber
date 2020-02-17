defmodule Jibber.ChatTest do
  use Jibber.DataCase

  alias Jibber.Chat
  alias Chat.Message

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

      assert room.id |> Chat.list_messages() |> Enum.map(& &1.id) == Enum.map(messages, & &1.id)
    end
  end

  describe "create_message/3" do
    test "returns ok tuple with message" do
      %{id: room_id} = insert(:room)
      %{id: user_id} = insert(:user)
      content = "content"

      assert {:ok, %Message{room_id: ^room_id, user_id: ^user_id, content: ^content}} =
               Chat.create_message(room_id, user_id, content)
    end
  end
end
