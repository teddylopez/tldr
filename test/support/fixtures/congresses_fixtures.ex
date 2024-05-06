defmodule Tldr.CongressesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Tldr.Congresses` context.
  """

  @doc """
  Generate a member.
  """
  def member_fixture(attrs \\ %{}) do
    {:ok, member} =
      attrs
      |> Enum.into(%{

      })
      |> Tldr.Congresses.create_member()

    member
  end
end
