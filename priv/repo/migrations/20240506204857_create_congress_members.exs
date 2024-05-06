defmodule Tldr.Repo.Migrations.CreateCongressMembers do
  use Ecto.Migration

  def change do
    create table(:congress_members) do
      add :bio_id, :string, required: true, distinct: true
      add :name, :string, required: true
      add :state, :string, required: true
      add :party, :string, required: true
      add :district, :integer, required: true, distinct: true
      add :headshot, :string
      add :terms, :map
      add :url, :string

      timestamps(type: :utc_datetime)
    end

    create index(:congress_members, :terms, using: :gin)
    create unique_index(:congress_members, [:bio_id])
    create index(:congress_members, :state)
    create index(:congress_members, :party)
    create index(:congress_members, :district)
  end
end
