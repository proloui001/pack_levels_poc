defmodule PocPacklevels.Repo.Migrations.CreatePackagingLevel do
  use Ecto.Migration

  def change do
    create table(:packaging_levels) do
      add :packaging_level_id, :string
      add :name, :string
      add :children_count, :integer
      add :parent_id, :string

      timestamps()
    end

  end
end
