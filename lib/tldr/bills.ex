defmodule Tldr.Bills do
  @moduledoc """
  The Bills context.
  """

  import Ecto.Query, warn: false
  alias Tldr.Repo

  alias Tldr.Bills.Bill

  def get_bill!(id), do: Repo.get!(Bill, id)

  def list_bills(params \\ %{}) do
    build_query(params)
  end

  defp base_query do
    from(bill in Bill,
      as: :bill
    )
  end

  defp build_query(params) do
    base_query()
    |> filter_by_bill_number(params[:bill_number])
    |> preload_congress(params[:preload_congress])
  end

  defp filter_by_bill_number(query, nil), do: query

  defp filter_by_bill_number(query, number) when is_binary(number),
    do: filter_by_bill_number(query, String.to_integer(number))

  defp filter_by_bill_number(query, number) when is_integer(number) do
    from([bill: bill] in query,
      where: bill.number == ^number
    )
  end

  defp filter_by_bill_number(query, numbers) when is_list(numbers) do
    from([bill: bill] in query,
      where: bill.number in ^numbers
    )
  end

  defp preload_congress(query, nil), do: query

  defp preload_congress(query, true) do
    from([bill: bill] in query,
      preload: :congress
    )
  end

  def create_bill(attrs \\ %{}) do
    %Bill{}
    |> Bill.changeset(attrs)
    |> Repo.insert()
  end

  def update_bill(%Bill{} = bill, attrs) do
    bill
    |> Bill.changeset(attrs)
    |> Repo.update()
  end

  def delete_bill(%Bill{} = bill) do
    Repo.delete(bill)
  end

  def change_bill(%Bill{} = bill, attrs \\ %{}) do
    Bill.changeset(bill, attrs)
  end
end
