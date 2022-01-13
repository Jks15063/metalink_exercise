# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :metalink_exercise,
  ecto_repos: [MetalinkExercise.Repo],
  children: [MetalinkExercise.Genservers.Opensea],
  opensea_client: MetalinkExercise.OpenseaClient

# Configures the endpoint
config :metalink_exercise, MetalinkExerciseWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "/nphQS8tOHeRR4u25spDGHYvdhwne5ju8efOXczTZ3nZMefqmLJr36glLA0HWJyp",
  render_errors: [view: MetalinkExerciseWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: MetalinkExercise.PubSub,
  live_view: [signing_salt: "EWiNHayx"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
