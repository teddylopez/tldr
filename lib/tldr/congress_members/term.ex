defmodule Tldr.CongressMembers.Term do
  @moduledoc false

  use Ecto.Schema

  import Ecto.Changeset

  embedded_schema do
    field(:chamber)
    field(:start_year)
    field(:end_year)
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [
      :chamber,
      :start_year,
      :end_year
    ])
    |> validate_required([
      :chamber,
      :start_year
    ])
  end
end
