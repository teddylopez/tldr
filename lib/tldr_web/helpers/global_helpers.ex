defmodule TldrWeb.Helpers.GlobalHelpers do
  def standardize_date(date) do
    [year, month, day] = String.split(date, "-", trim: true)
    "#{month}/#{day}/#{year}"
  end
end
