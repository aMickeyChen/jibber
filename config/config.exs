# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :jibber,
  ecto_repos: [Jibber.Repo]

# Configures the endpoint
config :jibber, JibberWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "0BKlcck4XSXt6tcoO6vQgcSrO1trdAWYm5xXNY2BJDaDtqeVX2YS/K87oSWfKHg3",
  render_errors: [view: JibberWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Jibber.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [
    signing_salt: "usOlC3WhIlowxpakubP/Rhnb6lMDySJp"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
