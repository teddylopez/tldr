defmodule Tldr.CongressMembersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Tldr.CongressMembers` context.
  """

  @doc """
  Generate a congress_member.
  """
  def congress_member_fixture(attrs \\ %{}) do
    {:ok, congress_member} =
      attrs
      |> Enum.into(%{

      })
      |> Tldr.CongressMembers.create_congress_member()

    congress_member
  end
end
