defmodule Tldr.LegislatorsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Tldr.Legislators` context.
  """

  @doc """
  Generate a legislator.
  """
  def legislator_fixture(attrs \\ %{}) do
    {:ok, legislator} =
      attrs
      |> Enum.into(%{

      })
      |> Tldr.Legislators.create_legislator()

    legislator
  end
end
