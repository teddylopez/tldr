defmodule Tldr.LegislatorFinancesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Tldr.LegislatorFinances` context.
  """

  @doc """
  Generate a legislator_finance.
  """
  def legislator_finance_fixture(attrs \\ %{}) do
    {:ok, legislator_finance} =
      attrs
      |> Enum.into(%{

      })
      |> Tldr.LegislatorFinances.create_legislator_finance()

    legislator_finance
  end
end
