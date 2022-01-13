defmodule MetalinkExercise.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      MetalinkExercise.Repo,
      # Start the Telemetry supervisor
      MetalinkExerciseWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: MetalinkExercise.PubSub},
      # Start the Endpoint (http/https)
      MetalinkExerciseWeb.Endpoint,
      MetalinkExercise.Genservers.Opensea
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MetalinkExercise.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    MetalinkExerciseWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
