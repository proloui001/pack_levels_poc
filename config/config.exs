# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :poc_packlevels,
  ecto_repos: [PocPacklevels.Repo]

# Configures the endpoint
config :poc_packlevels, PocPacklevels.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "hqF3AlgbYuYeX2HSvp+XCNcLeWRNRLWbR6Fumx/r8aF/8IOUxMQjL/179ivK++BH",
  render_errors: [view: PocPacklevels.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PocPacklevels.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
