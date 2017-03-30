defmodule PocPacklevels.PackagingLevelControllerTest do
  use PocPacklevels.ConnCase

  alias PocPacklevels.PackagingLevel
  @valid_attrs %{children_count: 42, id: "some content", name: "some content", parent_id: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, packaging_level_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing packaging levels"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, packaging_level_path(conn, :new)
    assert html_response(conn, 200) =~ "New packaging level"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, packaging_level_path(conn, :create), packaging_level: @valid_attrs
    assert redirected_to(conn) == packaging_level_path(conn, :index)
    assert Repo.get_by(PackagingLevel, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, packaging_level_path(conn, :create), packaging_level: @invalid_attrs
    assert html_response(conn, 200) =~ "New packaging level"
  end

  test "shows chosen resource", %{conn: conn} do
    packaging_level = Repo.insert! %PackagingLevel{}
    conn = get conn, packaging_level_path(conn, :show, packaging_level)
    assert html_response(conn, 200) =~ "Show packaging level"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, packaging_level_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    packaging_level = Repo.insert! %PackagingLevel{}
    conn = get conn, packaging_level_path(conn, :edit, packaging_level)
    assert html_response(conn, 200) =~ "Edit packaging level"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    packaging_level = Repo.insert! %PackagingLevel{}
    conn = put conn, packaging_level_path(conn, :update, packaging_level), packaging_level: @valid_attrs
    assert redirected_to(conn) == packaging_level_path(conn, :show, packaging_level)
    assert Repo.get_by(PackagingLevel, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    packaging_level = Repo.insert! %PackagingLevel{}
    conn = put conn, packaging_level_path(conn, :update, packaging_level), packaging_level: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit packaging level"
  end

  test "deletes chosen resource", %{conn: conn} do
    packaging_level = Repo.insert! %PackagingLevel{}
    conn = delete conn, packaging_level_path(conn, :delete, packaging_level)
    assert redirected_to(conn) == packaging_level_path(conn, :index)
    refute Repo.get(PackagingLevel, packaging_level.id)
  end
end
