defmodule PocPacklevels.Repo.Migrations.CreatePackagingLevelList do
  use Ecto.Migration

  def change do
    create table(:packaging_level_lists) do
      add :list_id, :string
      add :name, :string

      timestamps()
    end

  end
end
