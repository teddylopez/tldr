defmodule Tldr.Amendments do
  @moduledoc """
  The Amendments context.
  """

  import Ecto.Query, warn: false
  alias Tldr.Repo

  alias Tldr.Amendments.Amendment

  @doc """
  Returns the list of amendments.

  ## Examples

      iex> list_amendments()
      [%Amendment{}, ...]

  """
  def list_amendments do
    Repo.all(Amendment)
  end

  @doc """
  Gets a single amendment.

  Raises `Ecto.NoResultsError` if the Amendment does not exist.

  ## Examples

      iex> get_amendment!(123)
      %Amendment{}

      iex> get_amendment!(456)
      ** (Ecto.NoResultsError)

  """
  def get_amendment!(id), do: Repo.get!(Amendment, id)

  @doc """
  Creates a amendment.

  ## Examples

      iex> create_amendment(%{field: value})
      {:ok, %Amendment{}}

      iex> create_amendment(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_amendment(attrs \\ %{}) do
    %Amendment{}
    |> Amendment.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a amendment.

  ## Examples

      iex> update_amendment(amendment, %{field: new_value})
      {:ok, %Amendment{}}

      iex> update_amendment(amendment, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_amendment(%Amendment{} = amendment, attrs) do
    amendment
    |> Amendment.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a amendment.

  ## Examples

      iex> delete_amendment(amendment)
      {:ok, %Amendment{}}

      iex> delete_amendment(amendment)
      {:error, %Ecto.Changeset{}}

  """
  def delete_amendment(%Amendment{} = amendment) do
    Repo.delete(amendment)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking amendment changes.

  ## Examples

      iex> change_amendment(amendment)
      %Ecto.Changeset{data: %Amendment{}}

  """
  def change_amendment(%Amendment{} = amendment, attrs \\ %{}) do
    Amendment.changeset(amendment, attrs)
  end
end
