defmodule Tldr.CongressMembers.CongressMember do
  use Ecto.Schema
  import Ecto.Changeset

  schema "congress_members" do
    field :bio_id, :string
    field :name, :string
    field :state, :string
    field :party, :string
    field :district, :integer
    field :headshot, :string
    field :url, :string

    embeds_many(:terms, Tldr.CongressMembers.Term, on_replace: :delete)

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(congress_member, attrs) do
    congress_member
    |> cast(attrs, [:bio_id, :name, :state, :party, :district, :headshot, :url])
    |> cast_embed(:terms)
    |> validate_required([:bio_id, :name, :state, :party, :headshot, :url])
  end
end
