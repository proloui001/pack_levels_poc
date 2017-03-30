defmodule PocPacklevels.Repo.Migrations.LinkPackLevelsAndList do
  use Ecto.Migration

  def change do
    alter table(:packaging_level_lists) do
      add :packaging_level_id, references(:packaging_levels)
    end
  end
end
