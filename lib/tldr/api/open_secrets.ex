defmodule Tldr.Api.OpenSecrets do
  @moduledoc """
  https://www.opensecrets.org/open-data/api-documentation
  """

  @base_url "https://www.opensecrets.org/api"
  @key Application.get_env(:tldr, :open_secrets_api_key)
  @user_agent "tldr/1.0"
  @states ~w(AL AK AZ AR CA
             CO CT DE FL GA
             HI ID IL IN IA
             KS KY LA ME MD
             MA MI MN MS MO
             MT NE NV NH NJ
             NM NY NC ND OH
             OK OR PA RI SC
             SD TN TX UT VT
             VA WA WV WI WY)

  def get_data(opts \\ %{}) do
    endpoint = Map.get(opts, :endpoint, "/")
    headers = [{"User-Agent", @user_agent}]
    # key = Map.get(opts, :key, nil)
    timeout = Map.get(opts, :recv_timeout, 100_000)
    url = "#{@base_url}/#{endpoint}&apikey=#{@key}&output=json"

    case HTTPoison.get(url, headers, recv_timeout: timeout) do
      {:ok, %HTTPoison.Response{body: body}} ->
        {:ok, Jason.decode!(body)}

      {:error, %HTTPoison.Error{} = error} ->
        {:error, error}
    end
  end

    def import_legislators() do
    @states
    |> Task.async_stream(&fetch_legislators_for_state/1, max_concurrency: 10, timeout: 300_000)
    |> Enum.flat_map(fn
      {:ok, {:ok, legislators}} -> legislators
      {:ok, {:error, _error}} -> []
    end)
    |> Enum.map(&get_json_attributes/1)
    |> Enum.map(&Tldr.Api.OpenSecrets.Legislator.new/1)
    |> Enum.map(&Tldr.Api.OpenSecrets.Legislator.to_map/1)
    |> Enum.each(&Tldr.Legislators.create_legislator/1)
  end

  defp fetch_legislators_for_state(state) do
    endpoint = "?method=getLegislators&id=#{state}"
    get_data(%{endpoint: endpoint, key: "legislator"})
    |> case do
      {:ok, %{"response" => %{"legislator" => legislators}}} -> {:ok, legislators}
      {:error, _error} -> {:error, :failed_to_fetch}
    end
  end

  defp get_json_attributes(%{"@attributes" => attrs}), do: attrs
end
