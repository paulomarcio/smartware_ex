defmodule SmartwareEx.Repo do
  use Ecto.Repo,
    otp_app: :smartware_ex,
    adapter: Ecto.Adapters.MySQL
end
