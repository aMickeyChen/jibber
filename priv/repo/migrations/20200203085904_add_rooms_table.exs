defmodule Jibber.Repo.Migrations.AddRoomsTable do
  use Ecto.Migration

  def change do
    create table("rooms") do
      add :user_ids, {:array, :integer}
      timestamps()
    end
  end
end
