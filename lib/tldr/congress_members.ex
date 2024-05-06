defmodule Tldr.CongressMembers do
  @moduledoc """
  The CongressMembers context.
  """

  import Ecto.Query, warn: false
  alias Tldr.Repo

  alias Tldr.CongressMembers.CongressMember

  @doc """
  Returns the list of congress_members.

  ## Examples

      iex> list_congress_members()
      [%CongressMember{}, ...]

  """
  def list_congress_members do
    Repo.all(CongressMember)
  end

  @doc """
  Gets a single congress_member.

  Raises `Ecto.NoResultsError` if the Congress member does not exist.

  ## Examples

      iex> get_congress_member!(123)
      %CongressMember{}

      iex> get_congress_member!(456)
      ** (Ecto.NoResultsError)

  """
  def get_congress_member!(id), do: Repo.get!(CongressMember, id)

  @doc """
  Creates a congress_member.

  ## Examples

      iex> create_congress_member(%{field: value})
      {:ok, %CongressMember{}}

      iex> create_congress_member(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_congress_member(attrs \\ %{}) do
    %CongressMember{}
    |> CongressMember.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a congress_member.

  ## Examples

      iex> update_congress_member(congress_member, %{field: new_value})
      {:ok, %CongressMember{}}

      iex> update_congress_member(congress_member, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_congress_member(%CongressMember{} = congress_member, attrs) do
    congress_member
    |> CongressMember.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a congress_member.

  ## Examples

      iex> delete_congress_member(congress_member)
      {:ok, %CongressMember{}}

      iex> delete_congress_member(congress_member)
      {:error, %Ecto.Changeset{}}

  """
  def delete_congress_member(%CongressMember{} = congress_member) do
    Repo.delete(congress_member)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking congress_member changes.

  ## Examples

      iex> change_congress_member(congress_member)
      %Ecto.Changeset{data: %CongressMember{}}

  """
  def change_congress_member(%CongressMember{} = congress_member, attrs \\ %{}) do
    CongressMember.changeset(congress_member, attrs)
  end
end
