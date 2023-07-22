defmodule DemoSolid.Repo do
  use Ecto.Repo,
    otp_app: :demo_solid,
    adapter: Ecto.Adapters.Postgres
end
