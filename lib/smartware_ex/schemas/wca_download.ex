defmodule SmartwareEx.Schemas.WcaDownload do
  use Ecto.Schema

  alias SmartwareEx.Schemas.WcaProvider

  schema "wca_downloads" do
    field(:wca_provider_id, :integer)
    field(:mailing_code, :string)
    field(:quantity, :integer)
    field(:downloaded, :integer, default: 0)
    field(:created_at, :utc_datetime, default: Ecto.DateTime.utc())
    field(:updated_at, :utc_datetime, default: Ecto.DateTime.utc())

    belongs_to(
      :provider,
      WcaProvider,
      define_field: false,
      foreign_key: :wca_provider_id
    )
  end
end