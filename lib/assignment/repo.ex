defmodule Assignment.Repo do
  use Ecto.Repo,
    otp_app: :assignment,
    adapter: Ecto.Adapters.Postgres
end
