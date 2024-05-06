defmodule Tldr.CongressGov.Term do
  @enforce_keys [
    :chamber,
    :start_year,
    :end_year
  ]

  defstruct chamber: nil,
            start_year: nil,
            end_year: nil

  def new(json_data) do
    %__MODULE__{
      chamber: "#{json_data["chamber"]}",
      start_year: "#{json_data["startYear"]}",
      end_year: "#{json_data["endYear"]}"
    }
  end

  def to_map(session) do
    Map.from_struct(session)
  end
end
