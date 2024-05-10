defmodule Tldr.Repo.Migrations.AddSummaryToBills do
  use Ecto.Migration

  def change do
    alter table(:bills) do
      add :summary, :text, after: :title
    end
  end
end
