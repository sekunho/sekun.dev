defmodule Sekun.Repo do
  use Ecto.Repo,
    otp_app: :sekun,
    adapter: Ecto.Adapters.SQLite3
end
