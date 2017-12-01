defmodule MiniWow do
  def kill_mob(mob, character) do
    mob_exp = character.level * 5 + 45
    xp = character.experience + mob_exp
    character = %{ character | experience: xp }
    IO.puts "#{mob} killed for #{mob_exp}. You have #{character.experience} xp."
    character
  end

  def main(_args) do
    character =
      %{
        name: String.capitalize(Prompt.gets('name')),
        experience: 0,
        level: 1
      }
    IO.puts "Hello, #{character.name}."
    main_menu(character)
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
