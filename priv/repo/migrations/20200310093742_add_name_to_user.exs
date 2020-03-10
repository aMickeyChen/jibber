defmodule Jibber.Repo.Migrations.AddNameToUser do
  use Ecto.Migration

  def change do
    drop_if_exists unique_index(:users, [:email])

    alter table(:users) do
      add :name, :text, null: false
      remove :email
      remove :password
    end

    create unique_index(:users, [:name])
  end
end
