defmodule Tldr.IssuersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Tldr.Issuers` context.
  """

  @doc """
  Generate a issuer.
  """
  def issuer_fixture(attrs \\ %{}) do
    {:ok, issuer} =
      attrs
      |> Enum.into(%{

      })
      |> Tldr.Issuers.create_issuer()

    issuer
  end
end
