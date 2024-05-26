defmodule Tldr.Issuers.Issuer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "issuers" do
    field :name, :string
    field :ticker, :string
    field :sector, :string
    field :state, :string
    field :country, :string
    field :performance, :map
    field :number_of_trades, :integer
    field :number_of_politicians, :integer
    field :volume, :integer
    field :date_last_traded, :date

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(issuer, attrs) do
    issuer
    |> cast(attrs, [
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
    ])
    |> validate_required([:name])
  end
end
