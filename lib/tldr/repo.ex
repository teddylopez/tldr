defmodule Tldr.Repo do
  use Ecto.Repo,
    otp_app: :tldr,
    adapter: Ecto.Adapters.Postgres
end
