defmodule Tldr.AmendmentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Tldr.Amendments` context.
  """

  @doc """
  Generate a amendment.
  """
  def amendment_fixture(attrs \\ %{}) do
    {:ok, amendment} =
      attrs
      |> Enum.into(%{

      })
      |> Tldr.Amendments.create_amendment()

    amendment
  end
end
