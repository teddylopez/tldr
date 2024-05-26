defmodule Tldr.Api.CapitolTrades.Issuer do
  @enforce_keys [
    :name,
    :ticker,
    :sector,
    :state,
    :country,
    :performance,
    :number_of_trades,
    :number_of_politicians,
    :volume,
    :date_last_traded
  ]
  defstruct name: nil,
            ticker: nil,
            sector: nil,
            state: nil,
            country: nil,
            performance: nil,
            number_of_trades: nil,
            number_of_politicians: nil,
            volume: nil,
            date_last_traded: nil

  def new(json_data) do
    %__MODULE__{
      name: json_data["issuerName"],
      ticker: json_data["issuerTicker"],
      sector: json_data["sector"],
      state: json_data["_stateId"],
      country: json_data["country"],
      performance: json_data["performance"],
      number_of_trades: json_data["stats"]["countTrades"],
      number_of_politicians: json_data["stats"]["countPoliticians"],
      volume: json_data["stats"]["volume"],
      date_last_traded: json_data["stats"]["dateLastTraded"]
    }
  end

  def to_map(issuer), do: Map.from_struct(issuer)
end
