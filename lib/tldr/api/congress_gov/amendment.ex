defmodule Tldr.Api.CongressGov.Amendment do
  @enforce_keys [
      :congress_number,
      :number,
      :latest_action,
      :purpose,
      :type,
      :url
    ]
  defstruct congress_number: nil,
            latest_action: %{},
            number: nil,
            purpose: nil,
            type: nil,
            url: nil

  def new(json_data) do
    %__MODULE__{
      congress_number: json_data["congress"],
      number: json_data["number"],
      latest_action: json_data["latestAction"],
      purpose: json_data["purpose"],
      type: json_data["type"],
      url: json_data["url"]
    }
  end

  def to_map(amendment), do: Map.from_struct(amendment)
end
