defmodule Tldr.LegislatorFinances do
  @moduledoc """
  The LegislatorFinances context.
  """

  import Ecto.Query, warn: false
  alias Tldr.Repo

  alias Tldr.LegislatorFinances.LegislatorFinance

  @doc """
  Returns the list of legislator_finances.

  ## Examples

      iex> list_legislator_finances()
      [%LegislatorFinance{}, ...]

  """
  def list_legislator_finances do
    Repo.all(LegislatorFinance)
  end

  @doc """
  Gets a single legislator_finance.

  Raises `Ecto.NoResultsError` if the Legislator finance does not exist.

  ## Examples

      iex> get_legislator_finance!(123)
      %LegislatorFinance{}

      iex> get_legislator_finance!(456)
      ** (Ecto.NoResultsError)

  """
  def get_legislator_finance!(id), do: Repo.get!(LegislatorFinance, id)

  @doc """
  Creates a legislator_finance.

  ## Examples

      iex> create_legislator_finance(%{field: value})
      {:ok, %LegislatorFinance{}}

      iex> create_legislator_finance(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_legislator_finance(attrs \\ %{}) do
    %LegislatorFinance{}
    |> LegislatorFinance.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a legislator_finance.

  ## Examples

      iex> update_legislator_finance(legislator_finance, %{field: new_value})
      {:ok, %LegislatorFinance{}}

      iex> update_legislator_finance(legislator_finance, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_legislator_finance(%LegislatorFinance{} = legislator_finance, attrs) do
    legislator_finance
    |> LegislatorFinance.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a legislator_finance.

  ## Examples

      iex> delete_legislator_finance(legislator_finance)
      {:ok, %LegislatorFinance{}}

      iex> delete_legislator_finance(legislator_finance)
      {:error, %Ecto.Changeset{}}

  """
  def delete_legislator_finance(%LegislatorFinance{} = legislator_finance) do
    Repo.delete(legislator_finance)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking legislator_finance changes.

  ## Examples

      iex> change_legislator_finance(legislator_finance)
      %Ecto.Changeset{data: %LegislatorFinance{}}

  """
  def change_legislator_finance(%LegislatorFinance{} = legislator_finance, attrs \\ %{}) do
    LegislatorFinance.changeset(legislator_finance, attrs)
  end
end
