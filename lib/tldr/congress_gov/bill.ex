defmodule Tldr.CongressGov.Bill do
  @enforce_keys [
    :congress_number,
    :latest_action,
    :number,
    :origin_chamber,
    :origin_chamber_code,
    :title,
    :type,
    :update_date,
    :url
  ]
  defstruct congress_number: nil,
            latest_action: %{},
            number: nil,
            origin_chamber: nil,
            origin_chamber_code: nil,
            title: nil,
            type: nil,
            update_date: nil,
            url: nil

  def new(json_data) do
    %__MODULE__{
      congress_number: json_data["congress"],
      latest_action: json_data["latestAction"],
      number: json_data["number"],
      origin_chamber: json_data["originChamber"],
      origin_chamber_code: json_data["originChamberCode"],
      title: json_data["title"],
      type: json_data["type"],
      update_date: json_data["updateDateIncludingText"],
      url: json_data["url"]
    }
  end

  def to_map(congress_bilL), do: Map.from_struct(congress_bilL)
end
