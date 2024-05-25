defmodule Tldr.Repo.Migrations.CreateLegislators do
  use Ecto.Migration

  def change do
    create table(:legislators) do
      add :bio_id, :string, required: true
      add :cid, :string, required: true
      add :full_name, :string, required: true
      add :last_name, :string, required: true
      add :dob, :string
      add :party, :string
      add :office, :string
      add :congress_office_address, :string
      add :gender, :string
      add :first_elected, :string
      add :crp_exit_code, :string
      add :comments, :text
      add :phone, :string
      add :fax, :string
      add :website, :string
      add :webform, :string
      add :vote_smart_id, :integer
      add :fec_id, :string
      add :x_id, :string
      add :facebook_id, :string
      add :youtube_url, :string

      timestamps(type: :utc_datetime)
    end

    create unique_index(:legislators, [:bio_id])
    create unique_index(:legislators, [:cid])
    create unique_index(:legislators, [:vote_smart_id])
    create unique_index(:legislators, [:fec_id])
    create unique_index(:legislators, [:facebook_id])
    create unique_index(:legislators, [:youtube_url])
    create index(:legislators, :party)
    create index(:legislators, :gender)
    create index(:legislators, :first_elected)
  end
end
