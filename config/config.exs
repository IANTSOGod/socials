# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :socials,
  ecto_repos: [Socials.Repo],
  generators: [timestamp_type: :utc_datetime]

# Configures the endpoint
config :socials, SocialsWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [html: SocialsWeb.ErrorHTML, json: SocialsWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: Socials.PubSub,
  live_view: [signing_salt: "J8hJSv4u"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :socials, Socials.Mailer,
  adapter: Swoosh.Adapters.SMTP,
  relay: "smtp.gmail.com",
  username: "iantsochristianrazafindrazaka@example.com",
  password: "hhhhhh321",
  port: 587,
  # Si vous utilisez SSL, passez à true
  ssl: false,
  # :always si vous voulez forcer TLS
  tls: :if_available,
  auth: :always

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.17.11",
  socials: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configure tailwind (the version is required)
config :tailwind,
  version: "3.4.3",
  socials: [
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
