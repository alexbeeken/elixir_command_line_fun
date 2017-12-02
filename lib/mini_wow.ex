defmodule MiniWow do
  def kill_mob(mob, character) do
    mob_exp = character.level * 5 + 45
    Character.update_experience(character, mob_exp)
    IO.puts "#{mob} killed for #{mob_exp}. You have #{character.experience} xp."
    character
  end

  def main(_args) do
    case Character.new(String.capitalize(Prompt.gets('name'))) do
      { :ok, character } ->
        IO.puts "Hello, #{character.name}."
        main_menu(character)
      { :error, message } ->
        IO.puts message
        System.halt(0)
    end
  end

  def main_menu(character) do
    action = Prompt.choice("Main Menu", ["Actions", "Character"])
    perform_action(action, character)
  end

  def action_menu(character) do
    action = Prompt.choice("Actions", ["Kill Mindless Zombie", "Main Menu"])
    perform_action(action, character)
  end

  def perform_action(action, character) do
    case action do
      "Actions" ->
        action_menu(character)
      "Character" ->
        IO.puts "Name: #{character.name}"
        IO.puts "Experience: #{character.experience}"
        IO.puts "Level: #{character.level}"
        main_menu(character)
      "Kill Mindless Zombie" ->
        apply(__MODULE__, :kill_mob, ["Mindless Zombie", character])
        |> action_menu
    end
  end
end
