defmodule SmartwareEx.Common.WcaDownload do
  import Ecto.Query, only: [from: 2]

  alias SmartwareEx.Schemas.WcaDownload
  alias SmartwareEx.Repo

  def exists?(mailing_code) do
    Repo.all(
      from(
        w in WcaDownload,
        where: w.mailing_code == ^mailing_code,
        select: w
      )
    ) |> verify
  end

  def save(mailing_object, client) do
    response = Repo.insert(
      %WcaDownload{
        wca_provider_id: client.provider.id,
        mailing_code: mailing_object.mailing_code,
        quantity: String.to_integer(mailing_object.quantity),
        downloaded: 0
      },
      on_conflict: :nothing
    )

    case response do
      {:ok, _} -> IO.puts("Mailing #{mailing_object.mailing_code} saved successfully")
      {_}      -> IO.puts("Failed saving mailing #{mailing_object.mailing_code}")
    end
  end

  defp verify([]), do: {:ok, :false}
  defp verify([_]), do: {:ok, :true}
end