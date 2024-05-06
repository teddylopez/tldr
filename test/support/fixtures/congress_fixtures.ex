defmodule Tldr.CongressFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Tldr.Congress` context.
  """

  @doc """
  Generate a congresses.
  """
  def congresses_fixture(attrs \\ %{}) do
    {:ok, congresses} =
      attrs
      |> Enum.into(%{

      })
      |> Tldr.Congress.create_congresses()

    congresses
  end
end
