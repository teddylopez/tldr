defmodule Tldr.Repo.Migrations.CreateBills do
  use Ecto.Migration

  def change do
    create table(:bills) do
      add :number, :integer, required: true, distinct: true
      add :title, :text, required: true
      add :congress_number, :integer, required: true
      add :latest_action, :jsonb
      add :origin_chamber, :string, required: true
      add :origin_chamber_code, :string, required: true
      add :type, :string, required: true
      add :update_date, :naive_datetime, required: true
      add :url, :string, required: true

      timestamps(type: :utc_datetime)
    end

    create index(:bills, :congress_number)
    create index(:bills, :latest_action, using: :gin)
    create unique_index(:bills, [:number])
    create index(:bills, :origin_chamber)
    create index(:bills, :origin_chamber_code)
    create index(:bills, :type)
  end
end
