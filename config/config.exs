# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :demo_solid,
  ecto_repos: [DemoSolid.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :demo_solid, DemoSolidWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    formats: [json: DemoSolidWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: DemoSolid.PubSub,
  live_view: [signing_salt: "6qWHr9V7"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :demo_solid, DemoSolid.Mailer, adapter: Swoosh.Adapters.Local

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
