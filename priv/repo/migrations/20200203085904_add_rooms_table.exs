defmodule Jibber.Repo.Migrations.AddRoomsTable do
  use Ecto.Migration

  def change do
    create table("rooms") do
      add :user_ids, {:array, :integer}, default: []
      timestamps()
    end
  end
end
