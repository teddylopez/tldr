# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

# Set TLDR's environment variables at runtime:
defmodule EnvLoader do
  @moduledoc """
  Set environment variables from .env when starting server, handled in application.ex
  """

  @env_file ".env"

  def load_env do
    case File.read(@env_file) do
      {:ok, content} ->
        content
        |> String.split("\n")
        |> Enum.each(&parse_line/1)

        IO.puts("Environment variables loaded!")

      {:error, _} ->
        IO.puts("Error: Unable to read #{@env_file}")
    end
  end

  defp parse_line(line) do
    case String.split(line, "=", trim: true) do
      [key, val_with_quotes] ->
        key = String.trim(key)
        val = String.trim(val_with_quotes, "\"")
        System.put_env(key, val)

      _ ->
        nil
    end
  end
end

config :tldr, congress_gov_api_key: System.fetch_env!("CONGRESS_GOV_API_KEY")
config :tldr, open_secrets_api_key: System.fetch_env!("OPEN_SECRETS_API_KEY")

config :tldr,
  ecto_repos: [Tldr.Repo],
  generators: [timestamp_type: :utc_datetime]

# Configures the endpoint
config :tldr, TldrWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [html: TldrWeb.ErrorHTML, json: TldrWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: Tldr.PubSub,
  live_view: [signing_salt: "GBkiMkvI"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :tldr, Tldr.Mailer, adapter: Swoosh.Adapters.Local

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.17.11",
  tldr: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configure tailwind (the version is required)
config :tailwind,
  version: "3.4.0",
  tldr: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"

config :phoenix_live_view, debug_heex_annotations: true
