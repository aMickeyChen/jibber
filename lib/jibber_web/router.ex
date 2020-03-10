defmodule JibberWeb.Router do
  use JibberWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :authed do
    plug JibberWeb.BasicAuth, redirect_to: "/login"
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", JibberWeb do
    pipe_through :browser

    scope "/chat" do
      pipe_through [:authed]

      get "/", PageController, :index
    end

    resources "/login", SessionController, singleton: true, only: [:show]
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
