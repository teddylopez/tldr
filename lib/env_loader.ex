defmodule EnvLoader do
  @moduledoc """
  Set environment variables from .env when starting server, handled in application.ex
  """

  @env_file ".env"

  def load_env do
    case File.read(@env_file) do
      {:ok, content} ->
        content
        |> String.split("\n")
        |> Enum.each(&parse_line/1)

      {:error, _} ->
        IO.puts("Error: Unable to read #{@env_file}")
    end
  end

  defp parse_line(line) do
    case String.split(line, "=", trim: true) do
      [key, val_with_quotes] ->
        key = String.trim(key)
        val = String.trim(val_with_quotes, "\"")
        System.put_env(key, val)
      _ ->
        nil
    end
  end
end
