defmodule Tldr.Congresses.Congress do
  use Ecto.Schema
  import Ecto.Changeset

  schema "congresses" do
    field :number, :integer
    field :name, :string
    field :start_year, :integer
    field :end_year, :integer
    field :url, :string

    embeds_many(:sessions, Tldr.Congresses.Session, on_replace: :delete)
    has_many(:bills, Tldr.Bills.Bill, foreign_key: :congress_number, references: :number)

    timestamps()
  end

  @doc false
  def changeset(congresses, attrs) do
    congresses
    |> cast(attrs, [:number, :name, :start_year, :end_year, :url])
    |> cast_embed(:sessions)
    |> validate_required([:name, :start_year, :end_year, :url])
  end
end
