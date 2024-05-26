defmodule Tldr.LegislatorFinances.LegislatorFinance do
  use Ecto.Schema
  import Ecto.Changeset

  schema "legislator_finances" do
    field :legislator_name, :string
    field :legislator_cid, :string
    field :net_worth_low, :integer
    field :net_worth_high, :integer
    field :number_of_positions, :integer
    field :asset_count, :integer
    field :smallest_asset, :integer
    field :largest_asset, :integer
    field :transaction_count, :integer
    field :smallest_transaction, :integer
    field :largest_transaction, :integer
    field :source, :string
    field :origin, :string
    field :update_timestamp, :date

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(legislator_finance, attrs) do
    legislator_finance
    |> cast(attrs, [
      :legislator_name, :legislator_cid, :net_worth_low, :net_worth_high, :number_of_positions,
      :asset_count, :smallest_asset, :largest_asset, :transaction_count,
      :smallest_transaction, :largest_transaction, :source, :origin, :update_timestamp
    ])
    |> validate_required([
      :legislator_name, :legislator_cid, :net_worth_low, :net_worth_high, :number_of_positions,
      :asset_count, :smallest_asset, :largest_asset, :transaction_count,
      :smallest_transaction, :largest_transaction, :source, :origin, :update_timestamp
    ])
  end
end
