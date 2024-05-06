defmodule Tldr.Repo.Migrations.CreateCongresses do
  use Ecto.Migration

  def change do
    create table(:congresses) do
      add :number, :integer, required: true, distinct: true
      add :name, :string, required: true
      add :start_year, :integer, required: true
      add :end_year, :integer, required: true
      add :sessions, :map
      add :update_date, :naive_datetime, required: true
      add :url, :string, required: true

      timestamps(type: :utc_datetime)
    end

    create index(:congresses, :sessions, using: :gin)
    create unique_index(:congresses, [:number])
    create index(:congresses, :start_year)
    create index(:congresses, :end_year)
  end
end
