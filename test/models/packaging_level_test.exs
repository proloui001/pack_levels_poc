defmodule PocPacklevels.PackagingLevelTest do
  use PocPacklevels.ModelCase

  alias PocPacklevels.PackagingLevel

  @valid_attrs %{children_count: 42, id: "some content", name: "some content", parent_id: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = PackagingLevel.changeset(%PackagingLevel{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = PackagingLevel.changeset(%PackagingLevel{}, @invalid_attrs)
    refute changeset.valid?
  end
end
