defmodule SmartwareEx.Schemas.Client do
  use Ecto.Schema

  alias SmartwareEx.Schemas.WcaProvider

  schema "clients" do
    field(:name, :string)
    field(:wca, :integer, default: 0)
    field(:created_at, :utc_datetime, default: Ecto.DateTime.utc())
    field(:updated_at, :utc_datetime, default: Ecto.DateTime.utc())

    has_one(:provider, WcaProvider)
  end
end