defmodule PocPacklevels.PackagingLevelList do
  use PocPacklevels.Web, :model

  schema "packaging_level_lists" do
    field :list_id, :string
    field :name, :string

    has_many :packaging_levels, PocPacklevels.PackagingLevel
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:list_id, :name])
    |> validate_required([:list_id, :name])
  end
end
