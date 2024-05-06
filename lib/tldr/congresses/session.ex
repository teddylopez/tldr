defmodule Tldr.Congresses.Session do
  @moduledoc false

  use Ecto.Schema

  import Ecto.Changeset

  embedded_schema do
    field(:number)
    field(:chamber)
    field(:type)
    field(:start_date)
    field(:end_date)
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [
      :number,
      :chamber,
      :type,
      :start_date,
      :end_date
    ])
    |> validate_required([
      :number,
      :chamber,
      :type,
      :start_date
    ])
  end
end
