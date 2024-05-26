defmodule Tldr.Api.CapitolTrades do
  @moduledoc """
  Module for interacting with Capitol Trades API.
  """

  @base_url "https://bff.capitoltrades.com"
  @default_params %{
    pageSize: 12,
    recv_timeout: :infinity
  }

  def get_data(opts \\ %{}) do
    endpoint = Map.get(opts, :endpoint, "/")
    url = "#{@base_url}/#{endpoint}"

    case fetch_first_page(url) do
      {:ok, first_page_data} ->
        total_pages = get_in(first_page_data, ["meta", "paging", "totalPages"])

        tasks =
          Enum.map(1..total_pages, fn page ->
            Task.async(fn -> fetch_page(url, page) end)
          end)

        all_pages_data =
          tasks
          |> Enum.map(&Task.await/1)
          |> Enum.reduce(first_page_data["data"], fn {:ok, page_data}, acc ->
            acc ++ page_data["data"]
          end)

        process_and_import_data(all_pages_data)

      {:error, reason} ->
        IO.puts("Failed to fetch initial data: #{reason}")
    end
  end

  defp fetch_first_page(url) do
    fetch_page(url, 1)
  end

  defp fetch_page(url, page_number) do
    params = Map.put(@default_params, :page, page_number)

    case HTTPoison.get(url, [], params: params) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, Jason.decode!(body)}

      {:ok, %HTTPoison.Response{status_code: status_code}} ->
        {:error, "Unexpected status code: #{status_code}"}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end

  defp process_and_import_data(data) do
    Enum.each(data, fn issuer_data ->
      api_struct =
        Tldr.Api.CapitolTrades.Issuer.new(issuer_data)
        |> Map.from_struct()

      issuer = %Tldr.Issuers.Issuer{
        name: api_struct.name,
        ticker: api_struct.ticker,
        sector: api_struct.sector,
        state: api_struct.state,
        country: api_struct.country,
        performance: api_struct.performance,
        number_of_trades: api_struct.number_of_trades,
        number_of_politicians: api_struct.number_of_politicians,
        volume: api_struct.volume,
        date_last_traded: Date.from_iso8601!(api_struct.date_last_traded)
      }

      Tldr.Issuers.upsert_issuer(issuer)
    end)
  end

  def import_issuers() do
    get_data(%{
      endpoint:
        "issuers?metric=countTrades&metric=countPoliticians&metric=volume&metric=dateLastTraded"
    })
  end
end
