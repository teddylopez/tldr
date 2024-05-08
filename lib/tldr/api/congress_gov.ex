defmodule Tldr.Api.CongressGov do
  @moduledoc """
  https://api.congress.gov/
  https://github.com/LibraryOfCongress/api.congress.gov/

  Example: Tldr.Api.CongressGov.get_data("/bill")
  """

  @base_url "https://api.congress.gov/v3"
  @key Application.fetch_env!(:tldr, :congress_gov_api_key)

  def get_data(opts \\ %{}) do
    endpoint = Map.get(opts, :endpoint, "/")
    key = Map.get(opts, :key, nil)
    offset = Map.get(opts, :offset, 0)
    limit = Map.get(opts, :limit, 250)
    timeout = Map.get(opts, :timeout, 100_000)

    url = "#{@base_url}/#{endpoint}?api_key=#{@key}&offset=#{offset}&limit=#{limit}"
    {:ok, response} = HTTPoison.get(url, [], timeout: timeout)

    response_body = response.body |> Poison.decode!()

    case Map.get(response_body, "pagination") do
      %{"next" => next_page} ->
        # If there are more pages, recursively fetch them and concatenate the results
        next_data =
          get_data(%{endpoint: endpoint, key: key, offset: offset + limit, limit: limit})

        current_items = Map.get(response_body, key) || []
        Enum.concat(current_items, next_data)

      _ ->
        Map.get(response_body, key) || []
    end
  end

  def import_bills() do
    %{"bills" => list} = get_data(%{endpoint: "/bill", key: "bills"})

    list
    |> Enum.map(&Tldr.CongressGov.Bill.new(&1))
    |> Enum.map(&Tldr.CongressGov.Bill.to_map(&1))
    |> Enum.map(&Tldr.Bills.create_bill(&1))
  end

  def import_congresses() do
    get_data(%{endpoint: "/congress", key: "congressess"})
    |> Enum.map(&Tldr.CongressGov.Congress.new(&1))
    |> Enum.map(&Tldr.CongressGov.Congress.to_map(&1))
    |> Enum.map(&Tldr.Congresses.create_congress(&1))
  end

  def import_congress_members() do
    get_data(%{endpoint: "/member", key: "members"})
    |> Enum.map(&Tldr.CongressGov.Member.new(&1))
    |> Enum.map(&Tldr.CongressGov.Member.to_map(&1))
    |> Enum.map(&Tldr.CongressMembers.create_congress_member(&1))
  end
end
