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
end
