defmodule Tldr.Congresses do
  @moduledoc """
  The Congress context.
  """

  import Ecto.Query, warn: false
  alias Tldr.Repo

  alias Tldr.Congresses.Congress

  @doc """
  Returns the list of congress.

  ## Examples

      iex> list_congresses()
      [%Congress{}, ...]

  """
  def list_congresses do
    Repo.all(Congress)
  end

  @doc """
  Gets a single congress.

  Raises `Ecto.NoResultsError` if the Congress does not exist.

  ## Examples

      iex> get_congress!(123)
      %Congress{}

      iex> get_congress!(456)
      ** (Ecto.NoResultsError)

  """
  def get_congress!(id), do: Repo.get!(Congress, id)

  @doc """
  Creates a congress.

  ## Examples

      iex> create_congress(%{field: value})
      {:ok, %Congress{}}

      iex> create_congress(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_congress(attrs \\ %{}) do
    %Congress{}
    |> Congress.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a congress.

  ## Examples

      iex> update_congress(congress, %{field: new_value})
      {:ok, %Congress{}}

      iex> update_congress(congress, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_congress(%Congress{} = congress, attrs) do
    congress
    |> Congress.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a congress.

  ## Examples

      iex> delete_congress(congress)
      {:ok, %Congress{}}

      iex> delete_congress(congress)
      {:error, %Ecto.Changeset{}}

  """
  def delete_congress(%Congress{} = congress) do
    Repo.delete(congress)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking congress changes.

  ## Examples

      iex> change_congress(congress)
      %Ecto.Changeset{data: %Congress{}}

  """
  def change_congress(%Congress{} = congress, attrs \\ %{}) do
    Congress.changeset(congress, attrs)
  end
end
