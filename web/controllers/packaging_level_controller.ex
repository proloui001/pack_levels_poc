defmodule PocPacklevels.PackagingLevelController do
  use PocPacklevels.Web, :controller

  alias PocPacklevels.PackagingLevel

  def index(conn, _params) do
    packaging_levels = Repo.all(PackagingLevel)
    render(conn, "index.html", packaging_levels: packaging_levels)
  end

  def new(conn, _params) do
    changeset = PackagingLevel.changeset(%PackagingLevel{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"packaging_level" => packaging_level_params}) do
    IO.inspect(packaging_level_params)
    changeset = PackagingLevel.changeset(%PackagingLevel{}, packaging_level_params)

    case Repo.insert(changeset) do
      {:ok, _packaging_level} ->
        conn
        |> put_flash(:info, "Packaging level created successfully.")
        |> redirect(to: packaging_level_path(conn, :index))
      {:error, changeset} ->
        IO.inspect(changeset.errors)
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    packaging_level = Repo.get!(PackagingLevel, id)
    render(conn, "show.html", packaging_level: packaging_level)
  end

  def edit(conn, %{"id" => id}) do
    packaging_level = Repo.get!(PackagingLevel, id)
    changeset = PackagingLevel.changeset(packaging_level)
    render(conn, "edit.html", packaging_level: packaging_level, changeset: changeset)
  end

  def update(conn, %{"id" => id, "packaging_level" => packaging_level_params}) do
    packaging_level = Repo.get!(PackagingLevel, id)
    changeset = PackagingLevel.changeset(packaging_level, packaging_level_params)

    case Repo.update(changeset) do
      {:ok, packaging_level} ->
        conn
        |> put_flash(:info, "Packaging level updated successfully.")
        |> redirect(to: packaging_level_path(conn, :show, packaging_level))
      {:error, changeset} ->
        render(conn, "edit.html", packaging_level: packaging_level, changeset: changeset)
    end
  end

  def delete(conn, %{"packaging_level_id" => id}) do
    packaging_level = Repo.get!(PackagingLevel, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(packaging_level)

    conn
    |> put_flash(:info, "Packaging level deleted successfully.")
    |> redirect(to: packaging_level_path(conn, :index))
  end
end
