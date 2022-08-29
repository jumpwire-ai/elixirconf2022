defmodule Swiphly.Repo do
  use Ecto.Repo,
    otp_app: :swiphly,
    adapter: Ecto.Adapters.SQLite3
end
