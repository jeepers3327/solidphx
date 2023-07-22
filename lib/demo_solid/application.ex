defmodule DemoSolid.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl Application
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      DemoSolidWeb.Telemetry,
      # Start the Ecto repository
      DemoSolid.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: DemoSolid.PubSub},
      # Start Finch
      {Finch, name: DemoSolid.Finch},
      # Start the Endpoint (http/https)
      DemoSolidWeb.Endpoint
      # Start a worker by calling: DemoSolid.Worker.start_link(arg)
      # {DemoSolid.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: DemoSolid.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl Application
  def config_change(changed, _new, removed) do
    DemoSolidWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
