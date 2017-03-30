defmodule PocPacklevels.PackagingLevelListController do
  use PocPacklevels.Web, :controller

  alias PocPacklevels.PackagingLevelList

  def index(conn, _params) do
    packaging_level_lists = Repo.all(PackagingLevelList)
    render(conn, "index.html", packaging_level_lists: packaging_level_lists)
  end

  def new(conn, _params) do
    changeset = PackagingLevelList.changeset(%PackagingLevelList{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"packaging_level_list" => packaging_level_list_params}) do
    changeset = PackagingLevelList.changeset(%PackagingLevelList{}, packaging_level_list_params)

    case Repo.insert(changeset) do
      {:ok, _packaging_level_list} ->
        conn
        |> put_flash(:info, "Packaging level list created successfully.")
        |> redirect(to: packaging_level_list_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    packaging_level_list = Repo.get!(PackagingLevelList, id)
    render(conn, "show.html", packaging_level_list: packaging_level_list)
  end

  def edit(conn, %{"id" => id}) do
    packaging_level_list = Repo.get!(PackagingLevelList, id)
    changeset = PackagingLevelList.changeset(packaging_level_list)
    render(conn, "edit.html", packaging_level_list: packaging_level_list, changeset: changeset)
  end

  def update(conn, %{"id" => id, "packaging_level_list" => packaging_level_list_params}) do
    packaging_level_list = Repo.get!(PackagingLevelList, id)
    changeset = PackagingLevelList.changeset(packaging_level_list, packaging_level_list_params)

    case Repo.update(changeset) do
      {:ok, packaging_level_list} ->
        conn
        |> put_flash(:info, "Packaging level list updated successfully.")
        |> redirect(to: packaging_level_list_path(conn, :show, packaging_level_list))
      {:error, changeset} ->
        render(conn, "edit.html", packaging_level_list: packaging_level_list, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    packaging_level_list = Repo.get!(PackagingLevelList, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(packaging_level_list)

    conn
    |> put_flash(:info, "Packaging level list deleted successfully.")
    |> redirect(to: packaging_level_list_path(conn, :index))
  end
end
