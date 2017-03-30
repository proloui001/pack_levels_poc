defmodule PocPacklevels.PackagingLevelListControllerTest do
  use PocPacklevels.ConnCase

  alias PocPacklevels.PackagingLevelList
  @valid_attrs %{list_id: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, packaging_level_list_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing packaging level lists"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, packaging_level_list_path(conn, :new)
    assert html_response(conn, 200) =~ "New packaging level list"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, packaging_level_list_path(conn, :create), packaging_level_list: @valid_attrs
    assert redirected_to(conn) == packaging_level_list_path(conn, :index)
    assert Repo.get_by(PackagingLevelList, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, packaging_level_list_path(conn, :create), packaging_level_list: @invalid_attrs
    assert html_response(conn, 200) =~ "New packaging level list"
  end

  test "shows chosen resource", %{conn: conn} do
    packaging_level_list = Repo.insert! %PackagingLevelList{}
    conn = get conn, packaging_level_list_path(conn, :show, packaging_level_list)
    assert html_response(conn, 200) =~ "Show packaging level list"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, packaging_level_list_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    packaging_level_list = Repo.insert! %PackagingLevelList{}
    conn = get conn, packaging_level_list_path(conn, :edit, packaging_level_list)
    assert html_response(conn, 200) =~ "Edit packaging level list"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    packaging_level_list = Repo.insert! %PackagingLevelList{}
    conn = put conn, packaging_level_list_path(conn, :update, packaging_level_list), packaging_level_list: @valid_attrs
    assert redirected_to(conn) == packaging_level_list_path(conn, :show, packaging_level_list)
    assert Repo.get_by(PackagingLevelList, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    packaging_level_list = Repo.insert! %PackagingLevelList{}
    conn = put conn, packaging_level_list_path(conn, :update, packaging_level_list), packaging_level_list: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit packaging level list"
  end

  test "deletes chosen resource", %{conn: conn} do
    packaging_level_list = Repo.insert! %PackagingLevelList{}
    conn = delete conn, packaging_level_list_path(conn, :delete, packaging_level_list)
    assert redirected_to(conn) == packaging_level_list_path(conn, :index)
    refute Repo.get(PackagingLevelList, packaging_level_list.id)
  end
end
