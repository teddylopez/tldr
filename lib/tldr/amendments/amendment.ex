defmodule Tldr.Amendments.Amendment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "amendments" do
    field :number, :integer
    field :congress_number, :integer
    field :latest_action, :map
    field :purpose, :string
    field :type, :string
    field :url, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(amendment, attrs) do
    amendment
    |> cast(attrs, [:congress_number, :number, :latest_action, :purpose, :type, :url])
    |> validate_required([:congress_number, :number])
  end
end
