defmodule SmartwareEx.Wca.Synchronizer do
  alias SmartwareEx.Dao.Client, as: SmartwareClient
  alias SmartwareEx.Dao.WcaDownload, as: WcaMailing

  def update do
    SmartwareClient.get() |> clients
  end

  defp clients([]), do: {:ok, :finished}

  defp clients([client | clients]) do
    url = "#{client.provider.uri}"
    param = String.replace("#{client.provider.resume}", "#eps_id", "#{client.provider.eps_id}")

    download(url, param, client)

    clients(clients)
  end

  defp download(url, param, client) do
    HTTPoison.get("#{url}#{param}", [], timeout: 60_000, recv_timeout: 60_000) |> parser |> save(client)
  end

  defp save([], _client), do: {:ok, :finished}

  defp save([mailing | mailings], client) do
    mailing_object = String.split(mailing, "|") |> split_mailing
    exists = WcaMailing.exists?(mailing_object.mailing_code)

    case exists do
      {:ok, :false}  -> WcaMailing.save(mailing_object, client)
      {:ok, :true}   -> IO.puts("Mailing #{mailing_object.mailing_code} already inserted")
    end

    save(mailings, client)
  end

  # Splits the mailing into a map for Oi Provider
  defp split_mailing([eps_name, campaing_code, mailing_code, area_code, quantity]) do
    %{
      eps_name: eps_name,
      campaing_code: campaing_code,
      mailing_code: mailing_code,
      area_code: area_code,
      quantity: quantity
    }
  end

  # Splits the mailing into a map for Claro Provider
  defp split_mailing([mailing_code, quantity]) do
    %{mailing_code: mailing_code, quantity: quantity}
  end

  # Returns WebService message for connection error before parsing the return
  defp parser({:error, err}) do
    {:error, "Error while trying to open requested URL: #{err.reason}"}
  end

  # Parses the XML returned from WebService
  defp parser({:ok, response}) do
    Exml.parse("#{response.body}") |> Exml.get("//string")
  end
end