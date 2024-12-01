defmodule Day01Test do
  use ExUnit.Case, async: true

  test "sample part one" do
    input = """
    3   4
    4   3
    2   5
    1   3
    3   9
    3   3
    """

    assert input |> String.trim() |> Day01.part_one() == 11
  end

  test "real part one" do
    {:ok, input} = File.read("data/day01.txt")
    assert input |> String.trim() |> Day01.part_one() == 2_344_935
  end

  test "sample part two" do
    input = """
    3   4
    4   3
    2   5
    1   3
    3   9
    3   3
    """

    assert input |> String.trim() |> Day01.part_two() == 31
  end

  test "real part two" do
    {:ok, input} = File.read("data/day01.txt")
    assert input |> String.trim() |> Day01.part_two() == 27_647_262
  end
end
