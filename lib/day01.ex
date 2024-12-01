defmodule Day01 do
  @spec part_one(binary()) :: integer()
  def part_one(contents) do
    contents
    |> parsing()
    |> Enum.map(&Enum.sort/1)
    |> Enum.zip_with(fn [l, r] -> abs(l - r) end)
    |> Enum.sum()
  end

  @spec part_two(binary()) :: integer()
  def part_two(contents) do
    [left, right] =
      contents
      |> parsing()

    counts =
      right
      |> Enum.reduce(Map.new(), fn x, acc ->
        Map.update(acc, x, 1, fn cur_value -> cur_value + 1 end)
      end)

    left
    |> Enum.map(fn x -> x * Map.get(counts, x, 0) end)
    |> Enum.sum()
  end

  @spec parsing(binary()) :: list()
  defp parsing(content) do
    content
    |> String.split("\n")
    |> Enum.reduce({[], []}, fn line, {left, right} ->
      [l, r] =
        line
        |> String.split()
        |> Enum.map(&String.to_integer/1)

      {[l | left], [r | right]}
    end)
    |> Tuple.to_list()
  end
end
