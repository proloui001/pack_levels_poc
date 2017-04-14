defmodule PocPacklevels.PackagingLevel do
  use PocPacklevels.Web, :model

  schema "packaging_levels" do
    field :packaging_level_id, :string
    field :name, :string
    field :children_count, :integer
    field :parent_id, :string
    #belongs_to :packaging_level_list, PocPacklevels.PackagingLevelList
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:packaging_level_id, :name, :children_count, :parent_id])
    |> validate_required([:packaging_level_id, :name, :children_count, :parent_id])
  end
end
