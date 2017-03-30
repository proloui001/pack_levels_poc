defmodule PocPacklevels.PackagingLevelListTest do
  use PocPacklevels.ModelCase

  alias PocPacklevels.PackagingLevelList

  @valid_attrs %{list_id: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = PackagingLevelList.changeset(%PackagingLevelList{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = PackagingLevelList.changeset(%PackagingLevelList{}, @invalid_attrs)
    refute changeset.valid?
  end
end
