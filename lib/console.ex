defmodule Console do
  def clear do
    IO.puts IO.ANSI.clear
  end

  def new_menu(lines) do
    clear
    Enum.map(lines, &(IO.puts(&1)))
  end

  def message(message) do
    IO.puts message
  end
end
