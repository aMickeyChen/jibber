defmodule Jibber.Repo do
  use Ecto.Repo,
    otp_app: :jibber,
    adapter: Ecto.Adapters.Postgres
end
