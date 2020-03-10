defmodule Jibber.Repo.Migrations.AddNameToUser do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :name, :text, null: false
    end

    create unique_index(:users, [:name])
  end
end
