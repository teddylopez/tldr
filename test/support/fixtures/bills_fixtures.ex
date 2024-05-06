defmodule Tldr.BillsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Tldr.Bills` context.
  """

  @doc """
  Generate a bill.
  """
  def bill_fixture(attrs \\ %{}) do
    {:ok, bill} =
      attrs
      |> Enum.into(%{

      })
      |> Tldr.Bills.create_bill()

    bill
  end
end
