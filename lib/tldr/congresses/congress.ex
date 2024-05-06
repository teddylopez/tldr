defmodule Tldr.Congresses.Congress do
  use Ecto.Schema
  import Ecto.Changeset

  schema "congresses" do
    field :number, :integer
    field :name, :string
    field :start_year, :integer
    field :end_year, :integer
    field :update_date, :naive_datetime
    field :url, :string

    embeds_many(:sessions, Tldr.Congresses.Session, on_replace: :delete)
    has_many(:bills, Tldr.Bills.Bill, foreign_key: :congress_number)

    timestamps()
  end

  @doc false
  def changeset(congresses, attrs) do
    congresses
    |> cast(attrs, [:number, :name, :start_year, :end_year, :update_date, :url])
    |> cast_embed(:sessions)
    |> validate_required([:number, :name, :start_year, :end_year, :update_date, :url])
  end
end
