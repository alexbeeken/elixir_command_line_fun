defmodule Interface do

  def ask_for_name do
    "name"
    |> Console.gets
    |> String.capitalize
  end

  def message(message) do
    IO.ANSI.clear
    IO.puts message
  end

  def menu(state, title) do
    atom = String.to_atom(title)
    action = Console.choice(String.capitalize(title), apply(Menus, atom, []))
    Action.perform(state, action)
  end
end
