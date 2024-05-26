defmodule Tldr.Issuers do
  @moduledoc """
  The Issuers context.
  """

  import Ecto.Query, warn: false
  alias Tldr.Repo

  alias Tldr.Issuers.Issuer

  def get_issuer!(id), do: Repo.get!(Issuer, id)

  def list_issuers(params \\ %{}) do
    build_query(params)
  end

  defp base_query do
    from(issuer in Issuer,
      as: :issuer
    )
  end

  defp build_query(params) do
    base_query()
    |> sort_by(params[:sort_by])
  end

  defp sort_by(query, nil), do: query

  defp sort_by(query, :number_of_trades) do
    from([issuer: issuer] in query,
      order_by: [
        {:desc, field(issuer, :number_of_trades)},
        {:asc, field(issuer, :name)}
      ]
    )
  end

  def create_issuer(attrs \\ %{}) do
    %Issuer{}
    |> Issuer.changeset(attrs)
    |> Repo.insert()
  end

  def update_issuer(%Issuer{} = issuer, attrs) do
    issuer
    |> Issuer.changeset(attrs)
    |> Repo.update()
  end

  def delete_issuer(%Issuer{} = issuer) do
    Repo.delete(issuer)
  end

  def change_issuer(%Issuer{} = issuer, attrs \\ %{}) do
    Issuer.changeset(issuer, attrs)
  end

  # Upsert function to insert or update an issuer record
  def upsert_issuer(issuer) do
    case get_issuer_by_name(issuer.name) do
      nil ->
        # If the issuer doesn't exist, insert it
        insert_issuer(issuer)

      existing_issuer ->
        # If the issuer exists, update it

        update_issuer(existing_issuer, Map.from_struct(issuer))
    end
  end

  # Helper function to retrieve an issuer by ID
  defp get_issuer_by_name(name) do
    Repo.get_by(Issuer, name: name)
  end

  # Helper function to insert a new issuer record
  defp insert_issuer(issuer) do
    Repo.insert!(issuer)
  end
end
