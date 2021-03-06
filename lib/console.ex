defmodule Console do
  def clear do
    IO.puts IO.ANSI.clear
  end

  def choice(title, choices) do
    choice =
      "~~#{String.capitalize(title)}~~\n#{options(choices)}"
      |> IO.gets
      |> String.replace("\n", "")
      |> String.to_integer
      |> Kernel.-(1)

    Console.clear
    Enum.at(choices, choice)
  end

  def gets(thing) do
    IO.gets("What is your #{thing}?")
  end

  def menu(lines) do
    IO.ANSI.clear
    Enum.map(lines, &(IO.puts(&1)))
  end

  def message(message) do
    message = if is_list(message) do
                Enum.join(message, "\n")
              else
                message
              end
    IO.puts message
  end

  def options(_, accum \\ 1)

  def options([ h | t ], accum) do
    "#{accum} - #{h}\n" <> options(t, accum + 1)
  end

  def options([], _accum) do
    ""
  end
end
