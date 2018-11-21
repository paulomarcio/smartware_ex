defmodule SmartwareEx.Schemas.WcaProvider do
  use Ecto.Schema

  alias SmartwareEx.Schemas.WcaDownload

  schema "wca_providers" do
    field(:client_id, :integer)
    field(:eps_id, :string)
    field(:uri, :string)
    field(:resume, :string)
    field(:unblock, :string)
    field(:download, :string)
    field(:created_at, :utc_datetime, default: Ecto.DateTime.utc())
    field(:updated_at, :utc_datetime, default: Ecto.DateTime.utc())

    has_many(:downloads, WcaDownload)
  end
end
