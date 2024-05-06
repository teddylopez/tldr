defmodule Tldr.Bills.Bill do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bills" do
    field :number, :integer
    field :title, :string
    field :latest_action, :map
    field :origin_chamber, :string
    field :origin_chamber_code, :string
    field :type, :string
    field :update_date, :naive_datetime
    field :url, :string

    belongs_to(:congress, Tldr.Congresses.Congress,
      foreign_key: :congress_number,
      references: :number
    )

    timestamps()
  end

  @doc false
  def changeset(bill, attrs) do
    bill
    |> cast(attrs, [
      :congress_number,
      :latest_action,
      :number,
      :origin_chamber,
      :origin_chamber_code,
      :title,
      :type,
      :update_date,
      :url
    ])
    |> validate_required([
      :congress_number,
      :number,
      :origin_chamber,
      :origin_chamber_code,
      :title,
      :type,
      :update_date,
      :url
    ])
    |> unique_constraint(:number)
  end
end
