defmodule Tldr.CongressGov.Congress do
  @enforce_keys [
    :number,
    :name,
    :start_year,
    :end_year,
    :sessions,
    :url
  ]

  defstruct number: nil,
            name: nil,
            start_year: nil,
            end_year: nil,
            sessions: %{},
            url: nil

  def new(json_data) do
    %__MODULE__{
      number: parse_number(json_data["name"]),
      name: json_data["name"],
      start_year: json_data["startYear"],
      end_year: json_data["endYear"],
      sessions: parse_sessions(json_data) || [],
      url: json_data["url"]
    }
  end

  def to_map(congress) do
    Map.from_struct(congress)
  end

  defp parse_number(string) do
    string
    |> String.replace(~r/[^0-9]/, "")
    |> String.to_integer()
  end

  def parse_sessions(json_data) do
    json_data["sessions"]
    |> Enum.map(&Tldr.CongressGov.Session.new/1)
    |> Enum.map(&Tldr.CongressGov.Session.to_map/1)
  end
end
