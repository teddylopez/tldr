defmodule Tldr.Repo.Migrations.CreateIssuers do
  use Ecto.Migration

  def change do
    create table(:issuers) do
      add :name, :string
      add :ticker, :string
      add :sector, :string
      add :state, :string
      add :country, :string
      add :performance, :jsonb
      add :number_of_trades, :integer
      add :number_of_politicians, :integer
      add :volume, :integer
      add :date_last_traded, :date

      timestamps(type: :utc_datetime)
    end

    create index(:issuers, :name)
    create index(:issuers, :ticker)
    create index(:issuers, :sector)
    create index(:issuers, :country)
    create index(:issuers, :number_of_trades)
    create index(:issuers, :number_of_politicians)
    create index(:issuers, :volume)
    create index(:issuers, :date_last_traded)
  end
end
