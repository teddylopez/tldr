defmodule Tldr.Legislators.Legislator do
  use Ecto.Schema
  import Ecto.Changeset

  schema "legislators" do
    field :bio_id, :string
    field :cid, :string
    field :full_name, :string
    field :last_name, :string
    field :dob, :string
    field :party, :string
    field :office, :string
    field :congress_office_address, :string
    field :gender, :string
    field :first_elected, :string
    field :crp_exit_code, :string
    field :comments, :string
    field :phone, :string
    field :fax, :string
    field :website, :string
    field :webform, :string
    field :vote_smart_id, :integer
    field :fec_id, :string
    field :x_id, :string
    field :facebook_id, :string
    field :youtube_url, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(legislator, attrs) do
    legislator
    |> cast(attrs, [
      :bio_id,
      :cid,
      :full_name,
      :last_name,
      :dob,
      :party,
      :office,
      :congress_office_address,
      :gender,
      :first_elected,
      :crp_exit_code,
      :comments,
      :phone,
      :fax,
      :website,
      :webform,
      :vote_smart_id,
      :fec_id,
      :x_id,
      :facebook_id,
      :youtube_url
    ])
    |> validate_required([
      :bio_id,
      :cid,
      :full_name,
      :last_name
    ])
    |> unique_constraint(:bio_id)
    |> unique_constraint(:cid)
    |> unique_constraint(:vote_smart_id)
    |> unique_constraint(:fec_id)
    |> unique_constraint(:facebook_id)
    |> unique_constraint(:youtube_url)
  end
end
