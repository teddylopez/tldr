defmodule Tldr.CongressGov.Congress do
  @enforce_keys [
    :number,
    :name,
    :start_year,
    :end_year,
    :sessions,
    :update_date,
    :url
  ]

  defstruct number: nil,
            name: nil,
            start_year: nil,
            end_year: nil,
            sessions: %{},
            update_date: nil,
            url: nil

  def new(json_data) do
    %__MODULE__{
      number: json_data["number"],
      name: json_data["name"],
      start_year: json_data["startYear"],
      end_year: json_data["endYear"],
      sessions: parse_sessions(json_data) || [],
      update_date: json_data["updateDate"],
      url: json_data["url"]
    }
  end

  def to_map(congress) do
    Map.from_struct(congress)
  end

  def parse_sessions(json_data) do
    json_data["sessions"]
    |> Enum.map(&Tldr.CongressGov.Session.new/1)
    |> Enum.map(&Tldr.CongressGov.Session.to_map/1)
  end
end
