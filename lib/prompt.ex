defmodule Prompt do
  def gets(thing, count \\ 0) do
    thing =
      "What is your #{thing}?\n"
      |> IO.gets
      |> String.downcase
      |> String.replace("\n", "")
    Console.clear
    thing
  end

  def choice(thing, choices) do
    choice =
      "Choose your #{thing}:\noptions:\n#{options(choices)}"
      |> IO.gets
      |> String.replace("\n", "")
      |> String.to_integer
      |> Kernel.-(1)

    Console.clear
    Enum.at(choices, choice)
  end

  def options([ h | t ], accum \\ 1) do
    "#{accum} - #{h}\n" <> options(t, accum + 1)
  end

  def options([], _accum) do
    ""
  end
end
