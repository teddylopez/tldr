defmodule Tldr.Api.CongressGov.Bill do
  @enforce_keys [
    :congress_number,
    :latest_action,
    :number,
    :origin_chamber,
    :origin_chamber_code,
    :title,
    :summary,
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
            summary: nil,
            type: nil,
            update_date: nil,
            url: nil

  def new(%{bill: bill, summary: summary}) do
    %__MODULE__{
      congress_number: bill["congress"],
      latest_action: bill["latestAction"],
      number: bill["number"],
      origin_chamber: bill["originChamber"],
      origin_chamber_code: bill["originChamberCode"],
      title: bill["title"],
      summary: summary,
      type: bill["type"],
      update_date: bill["updateDateIncludingText"],
      url: bill["url"]
    }
  end

  def to_map(congress_bilL), do: Map.from_struct(congress_bilL)
end
