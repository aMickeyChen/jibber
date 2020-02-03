defmodule Jibber.ChatTest do
  use Jibber.DataCase
  alias Jibber.Chat

  describe "list_rooms/1" do
    test "return list of rooms from user IDs" do
      user = insert(:user)
      assert Chat.list_rooms(user.id)
    end
  end
end
