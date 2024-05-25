defmodule Tldr.Legislators do
  @moduledoc """
  The Legislators context.
  """

  import Ecto.Query, warn: false
  alias Tldr.Repo

  alias Tldr.Legislators.Legislator

  @doc """
  Returns the list of legislators.

  ## Examples

      iex> list_legislators()
      [%Legislator{}, ...]

  """
  def list_legislators do
    Repo.all(Legislator)
  end

  @doc """
  Gets a single legislator.

  Raises `Ecto.NoResultsError` if the Legislator does not exist.

  ## Examples

      iex> get_legislator!(123)
      %Legislator{}

      iex> get_legislator!(456)
      ** (Ecto.NoResultsError)

  """
  def get_legislator!(id), do: Repo.get!(Legislator, id)

  @doc """
  Creates a legislator.

  ## Examples

      iex> create_legislator(%{field: value})
      {:ok, %Legislator{}}

      iex> create_legislator(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_legislator(attrs \\ %{}) do
    %Legislator{}
    |> Legislator.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a legislator.

  ## Examples

      iex> update_legislator(legislator, %{field: new_value})
      {:ok, %Legislator{}}

      iex> update_legislator(legislator, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_legislator(%Legislator{} = legislator, attrs) do
    legislator
    |> Legislator.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a legislator.

  ## Examples

      iex> delete_legislator(legislator)
      {:ok, %Legislator{}}

      iex> delete_legislator(legislator)
      {:error, %Ecto.Changeset{}}

  """
  def delete_legislator(%Legislator{} = legislator) do
    Repo.delete(legislator)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking legislator changes.

  ## Examples

      iex> change_legislator(legislator)
      %Ecto.Changeset{data: %Legislator{}}

  """
  def change_legislator(%Legislator{} = legislator, attrs \\ %{}) do
    Legislator.changeset(legislator, attrs)
  end
end
