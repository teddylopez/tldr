defmodule Tldr.Repo.Migrations.CreateAmendments do
  use Ecto.Migration

  def change do
    create table(:amendments) do
      add :number, :integer, required: true
      add :congress_number, :integer, required: true
      add :latest_action, :jsonb
      add :purpose, :text
      add :type, :string
      add :url, :string

      timestamps(type: :utc_datetime)
    end

    create index(:amendments, :latest_action, using: :gin)
    create index(:amendments, [:congress_number])
    create index(:amendments, :number)
    create index(:amendments, :type)
  end
end
