defmodule Tldr.Repo.Migrations.CreateLegislatorFinances do
  use Ecto.Migration

  def change do
    create table(:legislator_finances) do
      add :legislator_name, :string
      add :crp_id, :string
      add :net_worth_low, :integer
      add :net_worth_high, :integer
      add :number_of_positions, :integer
      add :asset_count, :integer
      add :smallest_asset, :integer
      add :largest_asset, :integer
      add :transaction_count, :integer
      add :smallest_transaction, :integer
      add :largest_transaction, :integer
      add :source, :string
      add :origin, :string
      add :update_timestamp, :date

      timestamps(type: :utc_datetime)
    end

    create index(:legislator_finances, :net_worth_low)
    create index(:legislator_finances, :net_worth_high)
    create index(:legislator_finances, :number_of_positions)
    create index(:legislator_finances, :asset_count)
    create index(:legislator_finances, :smallest_asset)
    create index(:legislator_finances, :largest_asset)
    create index(:legislator_finances, :smallest_transaction)
    create index(:legislator_finances, :largest_transaction)
  end
end
