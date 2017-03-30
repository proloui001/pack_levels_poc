defmodule PocPacklevels.Router do
  use PocPacklevels.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PocPacklevels do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/packaging_levels", PackagingLevelController
    resources "/packaging_level_lists", PackagingLevelListController
  end

  # Other scopes may use custom stacks.
  # scope "/api", PocPacklevels do
  #   pipe_through :api
  # end
end
