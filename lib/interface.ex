defmodule Interface do

  def ask_for_name do
    "name"
    |> Console.gets
    |> String.capitalize
  end

  def message(message) do
    IO.ANSI.clear
    Console.message(message)
  end

  def menu(state, title) do
    action =
      title
      |> String.capitalize
      |> Console.choice(menu_options(title))

    Action.perform(state, action)
  end

  def menu_options(title) do
    apply(Menus, String.to_atom(title), [])
  end
end
