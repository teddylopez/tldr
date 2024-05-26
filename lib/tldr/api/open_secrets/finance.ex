defmodule Tldr.Api.OpenSecrets.Finance do
  @enforce_keys [
    :legislator_name,
    :legislator_cid,
    :net_worth_low,
    :net_worth_high,
    :number_of_positions,
    :asset_count,
    :smallest_asset,
    :largest_asset,
    :transaction_count,
    :smallest_transaction,
    :largest_transaction,
    :source,
    :origin,
    :update_timestamp
  ]

  defstruct legislator_name: nil,
    legislator_cid: nil,
    net_worth_low: nil,
    net_worth_high: nil,
    number_of_positions: nil,
    asset_count: nil,
    smallest_asset: nil,
    largest_asset: nil,
    transaction_count: nil,
    smallest_transaction: nil,
    largest_transaction: nil,
    source: nil,
    origin: nil,
    update_timestamp: nil

  def new(json_data) do
    %__MODULE__{
      legislator_name: json_data["name"],
      legislator_cid: json_data["member_id"],
      net_worth_low: json_data["net_low"],
      net_worth_high: json_data["net_high"],
      number_of_positions: json_data["positions_held_count"],
      asset_count: json_data["asset_count"],
      smallest_asset: json_data["asset_low"],
      largest_asset: json_data["asset_high"],
      transaction_count: json_data["transaction_count"],
      smallest_transaction: json_data["tx_low"],
      largest_transaction: json_data["tx_high"],
      source: json_data["source"],
      origin: json_data["origin"],
      update_timestamp: json_data["update_timestamp"],
    }
  end

  def to_map(congress), do: Map.from_struct(congress)
end
