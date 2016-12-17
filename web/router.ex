defmodule Studentmanager.Router do
  use Studentmanager.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Studentmanager.Auth, repo: Studentmanager.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Studentmanager do
    pipe_through :browser 

    get "/", PageController, :index
    get "/about", PageController, :about
    get "/info", PageController, :info
    get "/info/:instrument", PageController, :info

    get "register", UserController, :new
    get "/my_account", ProfileController, :show

    resources "/profiles", ProfileController
    resources "/students", StudentController

    resources "/sessions", SessionController, only: [:new, :create, :delete]
  end
  scope "/admin", Studentmanager do
    pipe_through :browser

    resources "/users", UserController
  end
end
