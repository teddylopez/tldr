defmodule Tldr.Congresses do
  @moduledoc """
  The Congress context.
  """

  import Ecto.Query, warn: false
  alias Tldr.Repo

  alias Tldr.Congresses.Congress

  def get_congress!(id), do: Repo.get!(Congress, id)

  def list_congresses(params \\ %{}) do
    build_query(params)
  end

  defp base_query do
    from(congress in Congress,
      as: :congress
    )
  end

  defp build_query(params) do
    base_query()
    |> preload_bills(params[:preload_bills])
    |> sort_by(params[:sort])
  end

  defp preload_bills(query, nil), do: query

  defp preload_bills(query, true) do
    from([congress: congress] in query,
      preload: :bills
    )
  end

  defp sort_by(query, %{sort_by: sort_by, sort_order: sort_order}) do
    case sort_by do
      :number ->
        from(congress in query,
          order_by: [
            {^sort_order, congress.number}
          ]
        )

      _ ->
        from(congress in query,
          order_by: [
            {^sort_order, ^sort_by}
          ]
        )
    end
  end

  defp sort_by(query, :latest_congress) do
    from(congress in query,
      order_by: [
        {:desc, congress.number}
      ],
      limit: 1
    )
  end

  def get_latest_congress!() do
    Congress
    |> order_by(desc: :number)
    |> limit(1)
    |> Repo.one!()
  end

  def create_congress(attrs \\ %{}) do
    %Congress{}
    |> Congress.changeset(attrs)
    |> Repo.insert()
  end

  def update_congress(%Congress{} = congress, attrs) do
    congress
    |> Congress.changeset(attrs)
    |> Repo.update()
  end

  def delete_congress(%Congress{} = congress) do
    Repo.delete(congress)
  end

  def change_congress(%Congress{} = congress, attrs \\ %{}) do
    Congress.changeset(congress, attrs)
  end
end
