defmodule Tldr.Api.CongressGov do
  @moduledoc """
  https://api.congress.gov/
  https://github.com/LibraryOfCongress/api.congress.gov/

  Example: Tldr.Api.CongressGov.get_data("/bill")
  """

  @base_url "https://api.congress.gov/v3"
  @key System.fetch_env!("CONGRESS_GOV_API_KEY")

  # Step 3: Make API Request with Access Token
  def get_data(api_endpoint) do
    url = "#{@base_url}/#{api_endpoint}?api_key=#{@key}"
    {:ok, response} = HTTPoison.get(url)

    response.body
    |> Poison.decode!()
  end

  def import_bills() do
    %{"bills" => list} = get_data("/bill")

    list
    |> Enum.map(&Tldr.CongressGov.Bill.new(&1))
    |> Enum.map(&Tldr.CongressGov.Bill.to_map(&1))
    |> Enum.map(&Tldr.Bills.create_bill(&1))
  end

  def import_congresses() do
    %{"congress" => congress} = get_data("/congress/current")

    congress
    |> Tldr.CongressGov.Congress.new()
    |> Tldr.CongressGov.Congress.to_map()
    |> Tldr.Congresses.create_congress()
  end
end
