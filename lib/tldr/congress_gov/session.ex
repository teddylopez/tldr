defmodule Tldr.CongressGov.Session do
  @enforce_keys [
    :number,
    :chamber,
    :type,
    :start_date,
    :end_date
  ]

  defstruct number: nil,
            chamber: nil,
            type: nil,
            start_date: nil,
            end_date: nil

  def new(json_data) do
    %__MODULE__{
      number: "#{json_data["number"]}",
      chamber: json_data["chamber"],
      start_date: json_data["startDate"],
      end_date: json_data["endDate"],
      type: json_data["type"]
    }
  end

  def to_map(session) do
    Map.from_struct(session)
  end
end
