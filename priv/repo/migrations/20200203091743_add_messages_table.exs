defmodule Jibber.Repo.Migrations.AddMessagesTable do
  use Ecto.Migration

  def change do
    create table("messages") do
      add :content, :string
      add :user_id, :integer

      add :room_id, references("rooms")

      timestamps()
    end
  end
end