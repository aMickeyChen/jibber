defmodule JibberWeb.Router do
  use JibberWeb, :router

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

  scope "/", JibberWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/", JibberWeb do
    pipe_through :api

    resources "/messages", ChatController, only: [:create]
  end

  # Other scopes may use custom stacks.
  # scope "/api", JibberWeb do
  #   pipe_through :api
  # end
end
