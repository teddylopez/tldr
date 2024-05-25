defmodule Tldr.Api.ImportHelpers do
  def ensure_at_prefix(""), do: nil
  def ensure_at_prefix("@" <> rest), do: rest
  def ensure_at_prefix(str), do: str

  def format_phone_number(phone_number) do
    phone_number
    |> String.replace(~r/\D/, "")   # Remove all non-numeric characters
    |> format_us_number()           # Format the cleaned number
  end

  defp format_us_number(<<area_code::binary-size(3), prefix::binary-size(3), line_number::binary-size(4)>>) do
    "(#{area_code})-#{prefix}-#{line_number}"
  end

  defp format_us_number(_), do: {:error, "Invalid phone number length"}

  def format_date(date_string) do
    date_string
    |> normalize_date()
    |> case do
      {:ok, {year, month, day}} -> format_iso({year, month, day})
      {:error, reason} -> {:error, reason}
    end
  end

  defp normalize_date(date_string) do
    cond do
      Regex.match?(~r/^\d{4}-\d{2}-\d{2}$/, date_string) ->
        # "YYYY-MM-DD"
        parse_date(date_string, ~r/^(\d{4})-(\d{2})-(\d{2})$/)

      Regex.match?(~r/^\d{4}\/\d{2}\/\d{2}$/, date_string) ->
        # "YYYY/MM/DD"
        parse_date(date_string, ~r/^(\d{4})\/(\d{2})\/(\d{2})$/)

      Regex.match?(~r/^\d{2}\/\d{2}\/\d{4}$/, date_string) ->
        # "MM/DD/YYYY"
        parse_date(date_string, ~r/^(\d{2})\/(\d{2})\/(\d{4})$/)

      Regex.match?(~r/^\d{2}-\d{2}-\d{4}$/, date_string) ->
        # "DD-MM-YYYY"
        parse_date(date_string, ~r/^(\d{2})-(\d{2})-(\d{4})$/)

      true ->
        {:error, "Unsupported date format"}
    end
  end

  defp parse_date(date_string, regex) do
    case Regex.run(regex, date_string) do
      [_, part1, part2, part3] when byte_size(part1) == 4 ->
        # YYYY-MM-DD or YYYY/MM/DD format
        {:ok, {String.to_integer(part1), String.to_integer(part2), String.to_integer(part3)}}

      [_, part1, part2, part3] ->
        # MM/DD/YYYY or DD-MM-YYYY format
        {:ok, {String.to_integer(part3), String.to_integer(part1), String.to_integer(part2)}}

      _ ->
        {:error, "Failed to parse date"}
    end
  end

  defp format_iso({year, month, day}), do: "#{year}-#{pad(month)}-#{pad(day)}"

  defp pad(number) when number < 10, do: "0#{number}"
  defp pad(number), do: Integer.to_string(number)
end
