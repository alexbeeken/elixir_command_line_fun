defmodule Interface do
  def ask_for_name do
    "name"
    |> Prompt.gets
    |> String.capitalize
  end

  def message(message) do
    IO.ANSI.clear
    IO.puts message
  end

  def main_menu(state) do
    action = Console.choice("Main Menu", [ "Actions", "Character" ])
    Action.perform(state, action)
  end

  def action_menu(state) do
    action = Console.choice("Actions", [ "Kill", "Main Menu" ])
    Action.perform(state, action)
  end
end
