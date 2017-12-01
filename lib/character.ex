defmodule Character do
  def new(name) do
    %{
      name: String.capitalize(name),
      experience: 0,
      level: 1
    }
  end

  def update_experience(character, gained) do
    xp = character.experience + gained
    character = %{ character | experience: xp }
    if level_up?(character), do: level_up(character), else: character
  end

  def level_up?(character) do
    character.level <= Experience.level_for_experience(character.experience)
  end

  def level_up(character) do
    new_level = Experience.level_for_experience(character.experience)
    IO.puts "Congratulations! You have reached level #{new_level}!"
    %{ character | level: new_level }
  end
end
