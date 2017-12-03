defmodule Experience do
  def build_a_bar(num_bars, count \\ 0) do
    cond do
      num_bars == 0 ->
        "[ " <> Enum.join(List.duplicate("-", 20)) <> " ]"
      count == 0 ->
        "[ #" <> build_a_bar(num_bars, count + 1)
      count >= num_bars ->
        Enum.join(List.duplicate("-", 20 - num_bars)) <> " ]"
      true ->
        "#" <> build_a_bar(num_bars, count + 1)
    end
  end

  def experience_for_level(level) do
    table()
    |> Enum.take(level - 1)
    |> Enum.sum
  end

  def level_for_experience(xp, accum \\ 0, index \\ 0) do
    accum = accum + Enum.at(table(), index)
    if accum > xp do
      index + 1
    else
      level_for_experience(xp, accum, index + 1)
    end
  end

  def progress_bar(experience, level) do
    if level != 60 do
      next_xp = Enum.at(table(), level - 1)
      current_xp = experience - experience_for_level(level)
      num_bars =
        current_xp
        |> Kernel./(next_xp)
        |> Kernel.*(20)
        |> Float.floor
        |> round
      build_a_bar(num_bars)
    end
  end

  def table do
    [
      400,
      900,
      1400,
      2100,
      2800,
      3600,
      4500,
      5400,
      6500,
      7600,
      8800,
      10100,
      11400,
      12900,
      14400,
      16000,
      17700,
      19400,
      21300,
      23200,
      25200,
      27300,
      29400,
      31700,
      34000,
      36400,
      38900,
      41400,
      44300,
      47400,
      50800,
      54500,
      58600,
      62800,
      67100,
      71600,
      76100,
      80800,
      85700,
      90700,
      95800,
      101000,
      106300,
      111800,
      117500,
      123200,
      129100,
      135100,
      141200,
      147500,
      153900,
      160400,
      167100,
      173900,
      180800,
      187900,
      195000,
      202300,
      209800,
      494000
    ]
  end
end
